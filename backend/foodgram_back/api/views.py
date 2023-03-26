from django.contrib.auth import get_user_model
from django.shortcuts import get_list_or_404, get_object_or_404
from django.http.response import HttpResponse
from djoser.views import UserViewSet
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.decorators import api_view, action
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import status, pagination

from main.models import (
    Tags, Recipe, Ingredients, ToBuyList, Favorites, Subscriptions
)
from .serializers import FavoriteSerializer, IngredientSerializer, SubSerializer

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
        print(
            Recipe.objects.filter(id=self.kwargs.get('recipe_id')).first()
        )
        Favorites.objects.get(
            recipe=Recipe.objects.filter(id=self.kwargs.get('recipe_id')).first(),
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


# class TagViewSet(ModelViewSet):
#     queryset = Tags.objects.all()
#     serializer_class = TagSerializer
#     http_method_names = ['get']


# class RecipeViewSet(ModelViewSet):
#     queryset = Recipe.objects.all()
#     serializer_class = RecipeSerializer
#     http_method_names = ['get', 'post', 'delete', 'patch']

#     def create(self, request, *args, **kwargs):
#         ingredients_data = request.data.get('ingredients')
#         serializer = RecipeSerializer(data=request.data)
#         if serializer.is_valid():
#             self.perform_create(serializer=serializer)
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#     def perform_create(self, serializer):
#         return serializer.save(
#             author=self.request.user
#         )


# @api_view(['GET'])
# def download_shoplist(request):
#     with open('./media/buy_list/', 'rb') as pdf:
#     response = HttpResponse(pdf.read(), content_type='application/pdf')
#     response['Content-Disposition'] = 'inline;filename=mypdf.pdf'
#     return response
