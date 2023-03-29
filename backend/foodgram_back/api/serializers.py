from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404
from djoser.serializers import UserSerializer

from main.models import (
    Tags, Recipe, Ingredients,
    Favorites, Subscriptions, IngredientsToRecipe
)


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
        recipe = get_object_or_404(Favorites, id=representation['id']).recipe
        representation.update({
            'name': recipe.name,
            'image': recipe.img,
            'cooking_time': recipe.time_to_cook
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


class CustomUserSerializer(UserSerializer):
    email = serializers.EmailField(required=True, max_length=254)
    first_name = serializers.CharField(required=True, max_length=150)
    second_name = serializers.CharField(
        required=True, max_length=150, source='last_name'
    )

    class Meta(UserSerializer.Meta):

        fields = (
            'email', 'id',
            'username', 'first_name',
            'second_name', 'password', 'is_subscribed'
        )
        extra_kwargs = {
            'password': {
                'write_only': True,
                'style': {'input_type': 'password'}
            }
        }
        read_only_fields = ('is_subscribed',)

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


class PasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('new_password', 'current_password')

    new_password = serializers.CharField(
        style={'input_type': 'password'},
        max_length=150, required=True
    )
    current_password = serializers.CharField(
        style={'input_type': 'password'},
        max_length=150, required=True
    )


class SubSerializer(serializers.ModelSerializer):

    class Meta:
        model = Subscriptions
        fields = ('author', 'sub')
        read_only_fields = fields

    def to_representation(self, instance):
        user_data = CustomUserSerializer(
            instance=instance.author
        ).data
        user_data.update({
            'recipe_count': instance.author.recipes.all().count(),
        })
        recipes = SubRecipeSerializer(
            instance.author.recipes.all(),
            many=True
        ).data
        if "recipes_limit" in self.context['request'].query_params.keys():
            recipes = SubRecipeSerializer(
                instance.author.recipes.all(),
                many=True
            ).data[
                :int(self.context['request'].query_params['recipes_limit'])
            ]
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
    image = serializers.CharField(source='img')
    text = serializers.CharField(source='description')
    ingredients = IngredientToRecipeSerializer(
        many=True, required=False
    )
    tags = serializers.PrimaryKeyRelatedField(
        many=True,
        queryset=Tags.objects.all()
    )
    author = CustomUserSerializer(read_only=True)

    class Meta:
        model = Recipe
        fields = (
            'id', 'tags',
            'author', 'name',
            'image', 'text',
            'cooking_time', 'ingredients'
        )

    def set_ing(self, ingredients, recipe):
        for ingredient in ingredients:
            print(ingredient)
            IngredientsToRecipe.objects.create(
                recipe=recipe,
                ingredient=get_object_or_404(
                    Ingredients,
                    id=ingredient['ingredient_id']
                ),
                amount=ingredient['amount']
            )

    def create(self, validated_data):
        ingredients = validated_data.pop('ingredients')
        tags = validated_data.pop('tags')
        recipe = Recipe.objects.create(**validated_data)
        recipe.tags.set(tags)
        self.set_ing(ingredients, recipe)
        return recipe

    def check_all_ings(self, ingredients, recipe):
        to_reset_amount = []
        for ing in ingredients:
            if ing['amount'] != IngredientsToRecipe.objects.get(
                    ingredient_id=ing['ingredient_id'],
                    recipe=recipe).amount:
                ingredients.pop(ing)
                to_reset_amount.append(ing)
            if IngredientsToRecipe.objects.filter(
                recipe=recipe,
                ingredient=ing['ingredient_id'],
                amount=ing['amount']
            ).exists():
                ingredients.pop(ing)
        self.set_amount(to_reset_amount)
        return ingredients

    def set_amount(self, ingredients):
        pass

    def update(self, instance, validated_data):
        recipe = instance.id
        if 'ingredients' in validated_data:
            ingredients = self.check_all_ings(
                validated_data.pop('ingredients'),
                recipe
            )
            ing_list = []
            for ingredient in ingredients:
                ing_list.append(
                    IngredientsToRecipe.objects.get_or_create(
                        
                    )
                )
        instance.save()
        return instance
