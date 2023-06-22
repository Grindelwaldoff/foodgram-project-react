from rest_framework import serializers
from drf_extra_fields.fields import Base64ImageField
from django.contrib.auth import get_user_model
from djoser.serializers import UserSerializer

from recipes.models import (
    Tags, Recipe, Ingredients,
    Favorites, IngredientsToRecipe, Basket
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


class FavoriteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Favorites
        fields = ('id',)

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation.update({
            'name': instance.recipe.name,
            'image': self.context.get('request').build_absolute_uri(
                instance.recipe.img.url
            ),
            'cooking_time': instance.recipe.time_to_cook
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
    image = serializers.CharField(source='img')

    class Meta:
        model = Recipe
        fields = (
            'id',
            'name', 'image',
            'cooking_time'
        )


class UserSerializerWithAdditionalFields(
    UserSerializer
):

    is_subscribed = serializers.SerializerMethodField()

    class Meta():
        model = User
        fields = ('username', 'email', 'last_name',
                  'first_name', 'id', 'is_subscribed')

    def get_is_subscribed(self, obj):
        if Subscriptions.objects.filter(
            author=obj,
            sub=self.context.get('request').user
        ).exists():
            return True
        return False


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
            instance.author.recipes.all(),
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
        user_data.update({
            'recipe': recipes
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
    tags = serializers.PrimaryKeyRelatedField(
        many=True,
        queryset=Tags.objects.all()
    )
    author = UserSerializerWithAdditionalFields(read_only=True)

    class Meta:
        model = Recipe
        fields = (
            'id', 'tags',
            'author', 'name',
            'image', 'text',
            'cooking_time', 'ingredients'
        )

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
