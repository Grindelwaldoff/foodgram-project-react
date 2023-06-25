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
    path('auth/', include('djoser.urls.authtoken')),
    path(
        '', include(router.urls)
    ),
]
