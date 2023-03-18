from rest_framework import serializers
from django.contrib.auth import get_user_model


User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True, max_length=254)
    first_name = serializers.CharField(required=True, max_length=150)
    second_name = serializers.CharField(
        required=True, max_length=150, source='last_name'
    )
    password = serializers.CharField(
        style={'input_type': 'password'},
        max_length=150, required=True, write_only=True
    )

    class Meta:
        model = User
        fields = (
            'email', 'id',
            'username', 'first_name',
            'second_name', 'password', 'is_subscribed'
        )
        read_only_fields = ('is_subscribed',)


class PasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('new_password', 'current_password')

    new_password = serializers.CharField(
        style={'input_type': 'password'},
        max_length=150, required=True
    )
    current_password = serializers.CharField(
        style={'input_type': 'password'},
        max_length=150, required=True
    )
