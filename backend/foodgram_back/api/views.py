import pdfkit
import jinja2
from django.contrib.auth import get_user_model
from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import get_list_or_404, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework import status, pagination, permissions

from main.models import (
    Tags, Recipe, Ingredients,
    Favorites, Subscriptions,
    Basket
)
from .filters import RecipeFilter, IngredientFilter
from .serializers import (
    BasketSerializer, FavoriteSerializer, IngredientSerializer,
    RecipeSerializer, SubscriptionsSerializer, TagSerializer
)

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
            recipe=get_object_or_404(Recipe, id=self.kwargs.get('recipe_id')),
            user=self.request.user
        )


class SubViewSet(ModelViewSet):
    queryset = Subscriptions.objects.all()
    serializer_class = SubscriptionsSerializer
    http_method_names = ['get', 'post', 'delete']

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

    def download(self, request):
        items_in_basket = get_list_or_404(Basket, user=self.request.user)
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
        self.generate_pdf(request, {'shopping_cart': shopping_cart})
        with open(
            f'./pdf/cart/shop_list_{request.user}.pdf',
            'rb'
        ) as pdf:
            response = HttpResponse(pdf.read(), content_type='application/pdf')
            response['Content-Disposition'] = 'inline;filename=shop_cart.pdf'
            return response

    def generate_pdf(self, request, context):
        template_loader = jinja2.FileSystemLoader('./')
        template_env = jinja2.Environment(loader=template_loader)
        template = template_env.get_template(
            './templates/shopping_list_template.html'
        )
        output_text = template.render(context)
        config = pdfkit.configuration(wkhtmltopdf=settings.HTML_TO_PDF_ROUTE)
        pdfkit.from_string(
            output_text,
            f'./pdf/cart/shop_list_{request.user}.pdf',
            configuration=config
        )

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
