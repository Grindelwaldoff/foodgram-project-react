from django.contrib.auth import get_user_model
from djoser.views import UserViewSet
from rest_framework.decorators import action

User = get_user_model()


class MeViewSet(UserViewSet):

    def me(self, request, *args, **kwargs):
        return super().me(request, *args, **kwargs)
