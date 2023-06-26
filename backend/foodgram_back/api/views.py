import pdfkit
from django.template.loader import render_to_string
from django.contrib.auth import get_user_model
from django.http import HttpResponse
from django.shortcuts import get_list_or_404, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from rest_framework import status, pagination, permissions

from recipes.models import (
    Tags, Recipe, Ingredients,
    Favorites,
    Basket
)
from api.filters import RecipeFilter, IngredientFilter
from api.serializers import (
    IngredientSerializer,
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

    @action(methods=['post'], detail=False,
            permission_classes=(permissions.IsAuthenticated,),
            url_path=r'(?P<recipe_id>\d+)/favorite')
    def add_to_favorites(self, request, recipe_id):
        try:
            Favorites.objects.get_or_create(
                user=request.user,
                recipe=Recipe.objects.get(id=recipe_id)
            )
            return Response(
                {'id': recipe_id},
                status=status.HTTP_201_CREATED
            )
        except Exception:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['delete'], detail=False,
            permission_classes=(permissions.IsAuthenticated,),
            url_path=r'(?P<recipe_id>\d+)/favorite')
    def del_favorites(self, request, recipe_id):
        try:
            Favorites.objects.filter(
                user=request.user,
                recipe=Recipe.objects.get(id=recipe_id)
            ).delete()
            return Response(
                {'id': recipe_id},
                status=status.HTTP_204_NO_CONTENT
            )
        except Exception:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=False,
            permission_classes=(permissions.IsAuthenticated,),
            url_path=r'(?P<recipe_id>\d+)/shopping_cart')
    def add_to_cart(self, request, recipe_id):
        try:
            Basket.objects.get_or_create(
                user=request.user,
                recipe=Recipe.objects.get(id=recipe_id)
            )
            return Response(
                {'id': recipe_id},
                status=status.HTTP_201_CREATED
            )
        except Exception:
            return Response(
                status=status.HTTP_400_BAD_REQUEST
            )

    @action(methods=['delete'], detail=False,
            permission_classes=(permissions.IsAuthenticated,),
            url_path=r'(?P<recipe_id>\d+)/shopping_cart')
    def del_basket(self, request, recipe_id):
        try:
            Basket.objects.filter(
                user=request.user, recipe_id=recipe_id
            ).delete()
            return Response(
                {'id': recipe_id},
                status=status.HTTP_204_NO_CONTENT
            )
        except Exception:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False,
            permission_classes=(permissions.IsAuthenticated,),
            url_path='download_shopping_cart')
    def download_basket(self, request):
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
        response['Content-Disposition'] = (
            'attachment; filename="shopping_list.pdf"'
        )
        return response
