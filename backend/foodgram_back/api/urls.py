from django.urls import path, include
from rest_framework.routers import SimpleRouter

from .views import MeViewSet, TagViewSet, RecipeViewSet


router = SimpleRouter()
# router.register('users', CustomUserViewSet)
router.register('tags', TagViewSet, basename='tags')
router.register('recipes', RecipeViewSet, basename='recipes')


urlpatterns = [
    path('users/me/', MeViewSet.as_view({'get': 'me'})),
    path('auth/', include('djoser.urls.authtoken')),
    # path('recipes/download_shopping_cart/', download_shoplist),
    path(
        '', include(router.urls)
    ),
]
