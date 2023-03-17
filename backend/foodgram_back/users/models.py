from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager


# class CustomUserManager(UserManager):
#     """Кастомный менеджер для юзеров."""

#     def create_superuser(self, username, email, password, **extra_fields):
#         extra_fields.setdefault('is_staff', True)
#         return super().create_superuser(
#             username, email, password, **extra_fields
#         )


class User(AbstractUser):
    """Кастомная модель юзера, в коорую включены доп поля."""

    is_subscribed = models.BooleanField(default=False)
    objects = UserManager()
