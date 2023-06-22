import pdfkit
from django.template.loader import render_to_string
from django.contrib.auth import get_user_model
from django.http import HttpResponse
from django.shortcuts import get_list_or_404, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework import status, pagination, permissions

from recipes.models import (
    Tags, Recipe, Ingredients,
    Favorites,
    Basket
)
from api.filters import RecipeFilter, IngredientFilter
from api.serializers import (
    BasketSerializer, FavoriteSerializer, IngredientSerializer,
    RecipeSerializer, SubscriptionsSerializer, TagSerializer
)
from users.models import Subscriptions

User = get_user_model()


class IgredientViewSet(ModelViewSet):
    queryset = Ingredients.objects.all()
    serializer_class = IngredientSerializer
    pagination_class = None
    permission_classes = (permissions.AllowAny,)
    http_method_names = ['get']
    filter_backends = (DjangoFilterBackend, IngredientFilter)
    search_fields = ('^name',)


class FavoriteViewSet(ModelViewSet):
    queryset = Favorites.objects.all()
    serializer_class = FavoriteSerializer
    pagination_class = None
    http_method_names = ['post', 'delete']

    @action(detail=False, methods=['DELETE'])
    def delete(self, request, *args, **kwargs):
        Favorites.objects.get(
            recipe=Recipe.objects.filter(
                id=self.kwargs.get('recipe_id')
            ).first(),
            user=self.request.user
        ).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def perform_create(self, serializer):
        serializer.save(
            recipe=get_object_or_404(
                Recipe,
                id=self.kwargs.get('recipe_id')
            ),
            user=self.request.user
        )


class SubViewSet(ModelViewSet):
    serializer_class = SubscriptionsSerializer
    http_method_names = ['get', 'post', 'delete']

    def get_queryset(self):
        return Subscriptions.objects.filter(sub=self.request.user)


class FollowViewSet(ModelViewSet):
    queryset = Subscriptions.objects.all()
    serializer_class = SubscriptionsSerializer
    pagination_class = pagination.LimitOffsetPagination
    http_method_names = ['post', 'delete', 'get']

    def get_queryset(self):
        return Subscriptions.objects.filter(
            sub=self.request.user
        )

    def perform_create(self, serializer):
        serializer.save(
            sub=self.request.user,
            author=get_object_or_404(User, id=self.kwargs.get('user_id'))
        )

    def delete(self, request, user_id):
        Subscriptions.objects.get(
            sub=request.user,
            author=get_object_or_404(User, id=user_id)
        ).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class TagViewSet(ModelViewSet):
    queryset = Tags.objects.all()
    serializer_class = TagSerializer
    pagination_class = None
    permission_classes = (permissions.AllowAny,)
    http_method_names = ['get']


class RecipeViewSet(ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    http_method_names = ['get', 'post', 'patch', 'delete']
    permission_classes = (permissions.AllowAny,)
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RecipeFilter

    def perform_create(self, serializer):
        serializer.save(
            author=self.request.user
        )


class BasketViewSet(ModelViewSet):
    queryset = Basket.objects.all()
    serializer_class = BasketSerializer
    permission_classes = ()

    def download(self, request):
        items_in_basket = get_list_or_404(
            Basket,
            user=User.objects.get(id=self.request.user.id)
        )
        shopping_cart = {}
        for item in items_in_basket:
            ing_list = item.recipe.ingredients.all()
            for ing in ing_list:
                try:
                    shopping_cart[ing.ingredient.name] += ing.amount
                except KeyError:
                    shopping_cart.update({
                        ing.ingredient.name: ing.amount
                    })
        html_string = render_to_string(
            '../templates/shopping_list_template.html',
            context={'shopping_cart': shopping_cart}
        )
        options = {
            'page-size': 'Letter',
            'encoding': 'UTF-8',
        }
        pdf_file = pdfkit.from_string(html_string, False, options=options)
        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename="shopping_list.pdf"'
        return response

    def perform_create(self, serializer):
        serializer.save(
            user=self.request.user,
            recipe=get_object_or_404(Recipe, id=self.kwargs.get('recipe_id'))
        )

    def delete(self, request, recipe_id):
        Basket.objects.get(
            user=request.user,
            recipe=get_object_or_404(Recipe, id=recipe_id)
        ).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
