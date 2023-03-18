from django.shortcuts import get_object_or_404
# from django.http import HttpResponse
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status
from http import HTTPStatus
from rest_framework.decorators import action
from rest_framework.pagination import PageNumberPagination

from users.models import User
from .serializers import UserSerializer, PasswordSerializer


class UserViewSet(ModelViewSet):
    # queryset = User.objects.all()/feed
    pagination_class = PageNumberPagination
    serializer_class = UserSerializer

    def get_queryset(self):
        if self.kwargs.get('id'):
            return get_object_or_404(User, id=self.kwargs.get('id'))
        return User.objects.all()

    @action(detail=False, methods=['get'])
    def me(self, request):
        query = get_object_or_404(User, username=request.user)
        serializer = self.get_serializer(query)
        return Response(serializer.data, status=HTTPStatus.OK)

    @action(detail=False, methods=['post'])
    def set_password(self, request):
        serializer = PasswordSerializer(data=request.data)
        if serializer.is_valid():
            if not self.request.user.check_password(
                serializer.data.get("current_password")
            ):
                return Response(
                    {"detail": "Учетные данные не были предоставлены."},
                    status=status.HTTP_401_UNAUTHORIZED
                )
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response(serializer.errors)
