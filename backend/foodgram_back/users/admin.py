from django.contrib import admin

from users.models import User
from main.models import (
    Tags, Recipe, Ingredients,
    Basket, Favorites, Subscriptions,
    IngredientsToRecipe
)


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_filter = ('email', 'username')


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ['author', 'name']
    list_filter = ('author', 'name', 'tags')
    readonly_fields = ('favorite_count',)

    def favorite_count(self, obj):
        return obj.favorites.all().count()


@admin.register(Ingredients)
class IngredientsAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    list_display = ('name', 'measurement_unit')


admin.site.register(Tags)
admin.site.register(Favorites)
admin.site.register(Basket)
admin.site.register(Subscriptions)
admin.site.register(IngredientsToRecipe)
