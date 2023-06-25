from django.contrib.auth import get_user_model
import django_filters.rest_framework as filter
from rest_framework.filters import SearchFilter

from recipes.models import Recipe
from users.models import ReworkedUser

User = get_user_model()


class IngredientFilter(SearchFilter):
    search_param = 'name'


class RecipeFilter(filter.FilterSet):
    tags = filter.AllValuesMultipleFilter(field_name='tags__slug')
    author = filter.ModelChoiceFilter(queryset=ReworkedUser.objects.all())
    is_favorited = filter.BooleanFilter(
        method='is_favorited_filter'
    )
    is_in_shopping_cart = filter.BooleanFilter(
        method='cart_filter'
    )

    class Meta:
        model = Recipe
        fields = (
            'is_favorited',
            'is_in_shopping_cart',
            'tags',
            'author',
        )

    def is_favorited_filter(self, queryset, name, value):
        if self.request.user.is_authenticated and value:
            return queryset.filter(favorites__user=self.request.user)
        return queryset

    def cart_filter(self, queryset, name, value):
        if self.request.user.is_authenticated and value:
            return queryset.filter(basket__user=self.request.user)
        return queryset
