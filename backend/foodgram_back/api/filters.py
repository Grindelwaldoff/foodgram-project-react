from django.contrib.auth import get_user_model
import django_filters as filter
from rest_framework.filters import SearchFilter

from main.models import Recipe, Favorites

User = get_user_model()


class IngredientFilter(SearchFilter):
    search_param = 'name'


class RecipeFilter(filter.FilterSet):
    tags = filter.AllValuesMultipleFilter(field_name='tags__slug')
    author = filter.AllValuesFilter(field_name='author')
    is_favorited = filter.BooleanFilter(
        method='is_favorited_filter'
    )
    is_in_shopping_cart = filter.BooleanFilter(
        method='cart_filter'
    )

    class Meta:
        model = Recipe
        fields = (
            'tags',
            'author',
            'is_favorited',
            'is_in_shopping_cart'
        )

    def is_favorited_filter(self, queryset, name, value):
        if self.request.user.is_authenticated and bool(value):
            return Favorites.objects.filter(user=self.request.user).select_related('recipe')
        return queryset

    def cart_filter(self, queryset, name, value):
        if self.request.user.is_authenticated and bool(value):
            return queryset.filter(basket__user=self.request.user)
        return queryset
