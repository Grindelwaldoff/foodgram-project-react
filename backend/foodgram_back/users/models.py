from django.db import models
from django.conf import settings
from django.core.validators import RegexValidator
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


class MyUser(AbstractUser):
    """Модель юзера с отредактированными полями."""

    email = models.EmailField(max_length=settings.EMAIL_MAX_LENGTH)
    username = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
        error_messages={
            'unique': _("A user with that username already exists."),
        },
        validators=[
            RegexValidator(
                regex='^[\w.@+-]+',
                message='Username is invalid'
            )
        ]
    )
