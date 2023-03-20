from django.contrib.auth import get_user_model
from django.http.response import HttpResponse
from djoser.views import UserViewSet
from rest_framework.decorators import api_view
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import mixins

from main.models import (
    Tags, Recipe, Ingredients, ToBuyList, Favorites, Subscriptions
)
from .serializers import TagSerializer, RecipeSerializer, FavoriteSerializer

User = get_user_model()


class MeViewSet(UserViewSet):

    def me(self, request, *args, **kwargs):
        return super().me(request, *args, **kwargs)


class TagViewSet(ModelViewSet):
    queryset = Tags.objects.all()
    serializer_class = TagSerializer
    http_method_names = ['get']


class RecipeViewSet(ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    http_method_names = ['get', 'post', 'delete', 'patch']

    def perform_create(self, serializer):
        return super().perform_create(
            serializer.save(
                author=self.request.user,
            )
        )


class FavoriteViewSet(mixins.CreateModelMixin,
                      mixins.DestroyModelMixin,
                      GenericViewSet):
    queryset = Favorites.objects.all()
    serializer_class = FavoriteSerializer


# @api_view(['GET'])
# def download_shoplist(request):
#     with open('./media/buy_list/', 'rb') as pdf:
#     response = HttpResponse(pdf.read(), content_type='application/pdf')
#     response['Content-Disposition'] = 'inline;filename=mypdf.pdf'
#     return response
