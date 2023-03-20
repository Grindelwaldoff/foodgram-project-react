from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404
from djoser.serializers import UserSerializer

from main.models import (
    Tags, Recipe, Ingredients,
    ToBuyList, Favorites, Subscriptions,
    IngredientsToRecipe
)


User = get_user_model()


class FavoriteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Favorites
        fields = ('id', 'name', 'image', 'cooking_time')


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


class IngredientSerializer(serializers.ModelSerializer):
    measurement_unit = serializers.CharField(source='un_of_me')

    class Meta:
        model = Ingredients
        fields = (
            'id', 'name', 'measurement_unit',
        )
        read_only_fields = ('name',)


class IngredientToRecipeSerializer(serializers.ModelSerializer):
    name = serializers.SerializerMethodField()
    measurement_unit = serializers.CharField(source='un_of_me')

    class Meta:
        model = IngredientsToRecipe
        fields = ('id', 'name', 'measurement_unit',
                  'recipe', 'ingredient')
        write_only_fields = ('recipe', 'ingredient')

    def get_name(self, obj):
        return IngredientSerializer(
            Ingredients.to_recipe(name=obj.name),
        ).data


class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tags
        fields = (
            'id', 'name',
            'color', 'slug'
        )


class RecipeSerializer(serializers.ModelSerializer):
    image = serializers.CharField(source='img')
    cooking_time = serializers.IntegerField(source='time_to_cook')
    author = CustomUserSerializer(read_only=True)
    text = serializers.CharField(source='description')
    ingredients = IngredientToRecipeSerializer(many=True)

    class Meta:
        model = Recipe
        fields = (
            'id', 'tags',
            'author', 'ingredients',
            'name', 'image', 'text', 'cooking_time'
        )

    def get_ingredients(self, obj):
        return IngredientSerializer(
            Ingredients.objects.filter(recipes=obj), many=True
        ).data

    def get_tags(self, obj):
        return TagSerializer(
            Tags.objects.filter(recipes=obj), many=True
        ).data

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['tags'] = self.get_tags(
            Recipe.objects.filter(id=instance.id).first()
        )
        representation['ingredients'] = self.get_ingredients(
            Recipe.objects.filter(id=instance.id).first()
        )
        for ingredient in representation['ingredients']:
            ingredient.update(
                {
                    'amount': get_object_or_404(
                        IngredientsToRecipe,
                        recipe=instance,
                        ingredient_id=ingredient['id']
                    ).amount
                }
            )
        return representation
