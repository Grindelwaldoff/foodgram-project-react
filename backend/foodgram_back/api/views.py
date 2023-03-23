from django.contrib.auth import get_user_model
from django.shortcuts import get_list_or_404, get_object_or_404
from django.http.response import HttpResponse
from rest_framework.response import Response
from djoser.views import UserViewSet
from rest_framework.decorators import api_view
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import mixins, status

from main.models import (
    Tags, Recipe, Ingredients, ToBuyList, Favorites, Subscriptions
)
from .serializers import FavoriteSerializer

User = get_user_model()


class MeViewSet(UserViewSet):

    def me(self, request, *args, **kwargs):
        return super().me(request, *args, **kwargs)


class FavoriteViewSet(ModelViewSet):
    queryset = Favorites.objects.all()
    serializer_class = FavoriteSerializer
    http_method_names = ['get', 'post']

    def perform_create(self, serializer):
        serializer.save(
            recipe=get_object_or_404(Recipe, id=self.kwargs.get('recipe_id')),
            user=self.request.user
        )

    def delete(self):
        Favorites.objects.get(
            recipe=get_object_or_404(Recipe, id=self.kwargs.get('recipe_id')),
            user=self.request.user
        ).delete()


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
