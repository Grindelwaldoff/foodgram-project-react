from django.contrib.auth import get_user_model
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from djoser.views import UserViewSet
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework import status, pagination
import weasyprint

from main.models import (
    Tags, Recipe, Ingredients,
    Favorites, Subscriptions,
    Basket
)
from .serializers import (
    BasketSerializer, FavoriteSerializer, IngredientSerializer,
    RecipeSerializer, SubSerializer, TagSerializer
)

User = get_user_model()


class MeViewSet(UserViewSet):

    def me(self, request, *args, **kwargs):
        return super().me(request, *args, **kwargs)


class IgredientViewSet(ModelViewSet):
    queryset = Ingredients.objects.all()
    serializer_class = IngredientSerializer
    pagination_class = None
    http_method_names = ['get']
    filter_backends = (SearchFilter,)
    search_fields = ['^name']


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
            recipe=get_object_or_404(Recipe, id=self.kwargs.get('recipe_id')),
            user=self.request.user
        )


class SubViewSet(ModelViewSet):
    queryset = Subscriptions.objects.all()
    serializer_class = SubSerializer
    http_method_names = ['get', 'post', 'delete']


class FollowViewSet(ModelViewSet):
    queryset = Subscriptions.objects.all()
    serializer_class = SubSerializer
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
    http_method_names = ['get']


class RecipeViewSet(ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    http_method_names = ['get', 'post', 'patch', 'delete']

    def perform_create(self, serializer):
        serializer.save(
            author=User.objects.get(
                username='admin'
            )
        )


class BasketViewSet(ModelViewSet):
    queryset = Basket.objects.all()
    serializer_class = BasketSerializer

    def download(self, request, recipe_id):
        return HttpResponse(content_type='application/pdf')

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
