from django.contrib import admin

from users.models import User
from main.models import (
    Tags, Recipe, Ingredients,
    Basket, Favorites, Subscriptions,
    IngredientsToRecipe
)


admin.site.register(User)
admin.site.register(Tags)
admin.site.register(Recipe)
admin.site.register(Favorites)
admin.site.register(Basket)
admin.site.register(Ingredients)
admin.site.register(Subscriptions)
admin.site.register(IngredientsToRecipe)
