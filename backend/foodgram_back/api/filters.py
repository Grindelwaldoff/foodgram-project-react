import django_filters as filter
from django_filters.widgets import BooleanWidget
from django.utils.translation import gettext as _

from main.models import Recipe


class NumBoolWidget(BooleanWidget):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.choices = (("", _("Anything else")), ("1", _("True")), ("0", _("False")))



class RecipeFilter(filter.FilterSet):
    tags = filter.AllValuesMultipleFilter(field_name='tags__slug')
    author = filter.AllValuesFilter(field_name='author')
    is_favorited = filter.BooleanFilter(
        method='is_favorited_filter', widget=NumBoolWidget
    )
    is_in_shopping_cart = filter.BooleanFilter(
        method='cart_filter', widget=NumBoolWidget
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
