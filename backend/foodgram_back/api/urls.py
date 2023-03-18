from django.urls import path, include
from rest_framework.routers import SimpleRouter

from .views import MeViewSet


router = SimpleRouter()
# router.register('users', CustomUserViewSet)


urlpatterns = [
    path('users/me/', MeViewSet.as_view({'get': 'me'})),
    path(
        '', include('djoser.urls')
    ),
]
