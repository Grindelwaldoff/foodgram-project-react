from rest_framework import serializers
from drf_extra_fields.fields import Base64ImageField
from django.contrib.auth import get_user_model

from recipes.models import (
    Tags, Recipe, Ingredients,
    IngredientsToRecipe, Basket
)
from users.models import Subscriptions


User = get_user_model()


class IngredientToRecipeSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(source='ingredient_id')

    class Meta:
        model = IngredientsToRecipe
        fields = ('amount', 'id')

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation.update({
            'name': instance.ingredient.name,
            'measurement_unit': instance.ingredient.measurement_unit
        })
        return representation


class IngredientSerializer(serializers.ModelSerializer):

    class Meta:
        model = Ingredients
        fields = (
            'id',
            'name',
            'measurement_unit'
        )


class SubRecipeSerializer(serializers.ModelSerializer):
    cooking_time = serializers.CharField(source='time_to_cook')
    image = Base64ImageField(source='img')

    class Meta:
        model = Recipe
        fields = (
            'id',
            'name', 'image',
            'cooking_time'
        )


class UserSerializerWithAdditionalFields(
    serializers.HyperlinkedModelSerializer
):

    is_subscribed = serializers.SerializerMethodField()

    class Meta():
        model = User
        fields = ('username', 'email', 'last_name',
                  'first_name', 'id', 'is_subscribed')

    def get_is_subscribed(self, obj):
        return (
            self.context.get('request').user.is_authenticated
            and obj.author.filter(
                sub=self.context.get('request').user
            ).exists()
        )


class SubscriptionsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Subscriptions
        fields = ('author', 'sub')
        read_only_fields = fields

    def to_representation(self, instance):
        user_data = UserSerializerWithAdditionalFields(
            instance=instance.author, context={
                'request': self.context['request'],
                'check_sub_tag': None
            }
        ).data
        user_data.update({
            'recipe_count': instance.author.recipes.all().count(),
        })

        recipes = SubRecipeSerializer(
            instance.author.recipes.all()[:1],
            many=True
        ).data
        if "recipes_limit" in self.context['request'].query_params.keys():
            try:
                recipes = SubRecipeSerializer(
                    instance.author.recipes.all(),
                    many=True
                ).data[
                    :int(self.context['request'].query_params['recipes_limit'])
                ]
            except Exception:
                raise ValueError('Recipes_limit value should be integer.')
        for recipe in recipes:
            recipe.update({
                'image': self.context.get('request').build_absolute_uri(
                    recipe.get('image')
                )
            })
        user_data.update({
            'recipes': recipes
        })
        return user_data


class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tags
        fields = (
            'id', 'name',
            'color',
            'slug'
        )
        read_only_fields = fields


class IngredientField(serializers.Field):
    def to_representation(self, value):
        return IngredientToRecipeSerializer(value, many=True).data


class RecipeSerializer(serializers.ModelSerializer):
    cooking_time = serializers.IntegerField(source='time_to_cook')
    image = Base64ImageField(source='img')
    text = serializers.CharField(source='description')
    ingredients = IngredientToRecipeSerializer(
        many=True, required=False
    )
    tags = serializers.SerializerMethodField()
    author = UserSerializerWithAdditionalFields(read_only=True)
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    class Meta:
        model = Recipe
        fields = (
            'id', 'tags',
            'author', 'name',
            'image', 'text',
            'cooking_time', 'ingredients',
            'is_favorited', 'is_in_shopping_cart'
        )

    def get_is_favorited(self, obj):
        if self.context.get('request').user.is_authenticated:
            return obj.favorites.filter(
                user=self.context.get('request').user
            ).exists()
        return False

    def get_is_in_shopping_cart(self, obj):
        if self.context.get('request').user.is_authenticated:
            return obj.basket.filter(
                user=self.context.get('request').user
            ).exists()
        return False

    def get_tags(self, obj):
        return TagSerializer(obj.tags, many=True).data

    def set_ing(self, ingredients, recipe):
        IngredientsToRecipe.objects.bulk_create(
            [IngredientsToRecipe(
                ingredient=Ingredients.objects.get(
                    id=ingredient['ingredient_id']
                ),
                amount=ingredient['amount'],
                recipe=recipe
            ) for ingredient in ingredients]
        )

    def create(self, validated_data):
        if validated_data['time_to_cook'] == 0:
            raise serializers.ValidationError(
                'Cooking time should be more than 0!'
            )
        ingredients = validated_data.pop('ingredients')
        tags = validated_data.pop('tags')
        recipe = Recipe.objects.create(**validated_data)
        recipe.tags.set(tags)
        self.set_ing(ingredients, recipe)
        return recipe

    def update(self, instance, validated_data):
        recipe = instance
        if 'ingredients' in validated_data:
            ingredients = validated_data.pop('ingredients')
            IngredientsToRecipe.objects.filter(recipe=recipe).delete()
            self.set_ing(ingredients, recipe)
        instance.save()
        return super().update(instance, validated_data)


class BasketSerializer(serializers.ModelSerializer):

    class Meta:
        model = Basket
        fields = (
            'id',
        )

    def to_representation(self, instance):
        repr = super().to_representation(instance)
        repr.update({
            'name': instance.recipe.name,
            'image': self.context.get('request').build_absolute_uri(
                instance.recipe.img.url
            ),
            'cooking_time': instance.recipe.time_to_cook
        })
        return repr
