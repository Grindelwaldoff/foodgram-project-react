from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager


class User(AbstractUser):
    """Кастомная модель юзера, в коорую включены доп поля."""

    objects = UserManager()
