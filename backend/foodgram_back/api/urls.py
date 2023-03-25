from django.urls import path, include
from rest_framework.routers import SimpleRouter

from .views import IgredientViewSet, MeViewSet, FavoriteViewSet, SubViewSet

router = SimpleRouter()
router.register('ingredients', IgredientViewSet, basename='ing')
# # router.register('users', CustomUserViewSet)
# router.register('tags', TagViewSet, basename='tags')
# router.register('recipes', RecipeViewSet, basename='recipes')
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
    path('users/me/', MeViewSet.as_view({'get': 'me'})),
    path('auth/', include('djoser.urls.authtoken')),
    # path('recipes/download_shopping_cart/', download_shoplist),
    path(
        '', include(router.urls)
    ),
]
