from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404
from djoser.views import UserViewSet
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework import status, pagination

from main.models import (
    Tags, Recipe, Ingredients,
    Favorites, Subscriptions,
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

    # def create(self, request, *args, **kwargs):
    #     serializer = self.get_serializer(data=request.data)
    #     try:
    #         if serializer.is_valid():
    #             self.perform_create(serializer)
    #             recipe = get_object_or_404(
    #                 Recipe,
    #                 id=serializer.data.get('id')
    #             )
    #             self.work_with_tags(request, recipe)
    #             self.work_with_ingredients(request, recipe)
    #             return Response(
    #                 RecipeSerializer(
    #                     Recipe.objects.get(id=serializer.data.get('id'))
    #                 ).data,
    #                 status=status.HTTP_201_CREATED
    #             )
    #             d
    #     except Exception:
    #         Response(serializer.error, status=status.HTTP_400_BAD_REQUEST)

    # def work_with_ingredients(self, request, recipe):
    #     try:
    #         for ingredient in request.data.get('ingredients'):
    #             IngredientsToRecipe.objects.get_or_create(
    #                 recipe=recipe,
    #                 ingredient=get_object_or_404(
    #                     Ingredients, id=ingredient['id'],
    #                 ),
    #                 amount=ingredient['amount']
    #             )
    #     except Exception:
    #         raise ValueError(
    #             '"ingredients" - обязательное поле для заполнения.'
    #         )

    # def work_with_tags(self, request, recipe):
    #     try:
    #         for tag in request.data.get('tags'):
    #             recipe.tags.add(
    #                 get_object_or_404(Tags, id=tag)
    #             )
    #     except Exception:
    #         raise ValueError(
    #             '"tags" - обязательное поле для добавление рецепта.'
    #         )

    def perform_create(self, serializer):
        serializer.save(
            author=User.objects.get(
                username='admin'
            )
        )

# @api_view(['GET'])
# def download_shoplist(request):
#     with open('./media/buy_list/', 'rb') as pdf:
#     response = HttpResponse(pdf.read(), content_type='application/pdf')
#     response['Content-Disposition'] = 'inline;filename=mypdf.pdf'
#     return response
