from django.contrib import admin
from django.forms import ModelForm

from recipes.models import (
    Tags, Recipe, Ingredients,
    Basket, Favorites,
    IngredientsToRecipe
)
from users.models import ReworkedUser, Subscriptions


class IngsToRecipeTab(admin.TabularInline):
    model = IngredientsToRecipe
    min_num = 1


class FieldsChecker(ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['first_name'].required = True
        self.fields['last_name'].required = True


@admin.register(ReworkedUser)
class UserAdmin(admin.ModelAdmin):
    list_filter = ('email', 'username')
    form = FieldsChecker


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ['author', 'name']
    list_filter = ('author', 'name', 'tags')
    readonly_fields = ('favorite_count',)
    inlines = [IngsToRecipeTab]

    def favorite_count(self, obj):
        return obj.favorites.count()


@admin.register(Ingredients)
class IngredientsAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    list_display = ('name', 'measurement_unit')


admin.site.register(Tags)
admin.site.register(Favorites)
admin.site.register(Basket)
admin.site.register(Subscriptions)
