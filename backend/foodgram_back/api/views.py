from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404
from djoser.views import UserViewSet
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework import status, pagination

from main.models import (
    Tags, Recipe, Ingredients, Favorites, Subscriptions
)
from .serializers import (
    FavoriteSerializer, IngredientSerializer, RecipeSerializer,
    SubSerializer, TagSerializer)

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
#         return Response(
    #           serializer.errors, status=status.HTTP_400_BAD_REQUEST)

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
