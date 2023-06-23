from django.urls import path, include
from rest_framework.routers import SimpleRouter

from api.views import (
    FollowViewSet,
    IgredientViewSet,
    RecipeViewSet, TagViewSet,
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
    'users/subscriptions',
    FollowViewSet,
    basename='subs'
)


urlpatterns = [
    path(
        'recipes/<int:recipe_id>/favorite/',
        RecipeViewSet.as_view({
            'post': 'post_favorites',
            'delete': 'del_favorites'
        })
    ),
    path('auth/', include('djoser.urls.authtoken')),
    path(
        'recipes/<int:recipe_id>/shopping_cart/',
        RecipeViewSet.as_view({
            'post': 'post_basket',
            'delete': 'del_basket'
        })
    ),
    path(
        'recipes/download_shopping_cart/',
        RecipeViewSet.as_view({
            'get': 'download_basket'
        })
    ),
    path(
        '', include(router.urls)
    ),
]
