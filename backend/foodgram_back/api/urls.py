from django.urls import path, include
from rest_framework.routers import SimpleRouter

from .views import (
    FavoriteViewSet, FollowViewSet,
    IgredientViewSet,
    RecipeViewSet, SubViewSet, TagViewSet,
    BasketViewSet
)

router = SimpleRouter()
router.register('ingredients', IgredientViewSet, basename='ing')
router.register('tags', TagViewSet, basename='tags')
router.register('recipes', RecipeViewSet, basename='recipes')
router.register(
    r'users/(?P<user_id>\d+)/subscribe',
    FollowViewSet, basename='follow'
)
router.register(
    r'recipes/(?P<recipe_id>\d+)/favorite',
    FavoriteViewSet,
    basename='favorites'
)
router.register(
    'users/subscriptions',
    SubViewSet,
    basename='subs'
)


urlpatterns = [
    path('auth/', include('djoser.urls.authtoken')),
    path(
        'recipes/<int:recipe_id>/shopping_cart/',
        BasketViewSet.as_view({
            'post': 'create',
            'delete': 'delete'
        })
    ),
    path('recipes/download_shopping_cart/',
         BasketViewSet.as_view({
            'get': 'download'
        })
    ),
    path(
        '', include(router.urls)
    ),
]
