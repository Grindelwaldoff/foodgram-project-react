from django.contrib import admin

from users.models import User
from main.models import (
    Tags, Recipe, Ingredients,
    ToBuyList, Favorites, Subscriptions
)


admin.site.register(User)
admin.site.register(Tags)
admin.site.register(Recipe)
admin.site.register(Favorites)
admin.site.register(ToBuyList)
admin.site.register(Ingredients)
admin.site.register(Subscriptions)
