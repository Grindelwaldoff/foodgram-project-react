import django_filters as filter

from main.models import Recipe


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
        if self.request.user.is_authenticated:
            return queryset.filter(favorites__user=self.request.user)
        return queryset

    def cart_filter(self, queryset, name, value):
        if self.request.user.is_authenticated:
            return queryset.filter(basket__user=self.request.user)
        return queryset
