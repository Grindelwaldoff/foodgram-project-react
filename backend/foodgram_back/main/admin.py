from django.contrib import admin

from main.models import (
    Tags, Recipe, Ingredients,
    Basket, Favorites, Subscriptions,
    IngredientsToRecipe
)


class UserAdmin(admin.ModelAdmin):
    list_filter = ('email', 'username')


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ['author', 'name']
    list_filter = ('author', 'name', 'tags')
    readonly_fields = ('favorite_count',)

    def favorite_count(self, obj):
        return Favorites.objects.filter(recipe=obj).count()


@admin.register(Ingredients)
class IngredientsAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    list_display = ('name', 'measurement_unit')


@admin.register(IngredientsToRecipe)
class IngredientsRecipeAdmin(admin.ModelAdmin):
    list_display = ['recipe', 'ingredient', 'amount']


admin.site.register(Tags)
admin.site.register(Favorites)
admin.site.register(Basket)
admin.site.register(Subscriptions)
