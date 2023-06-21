from django.db import models
from django.conf import settings
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

from users.validators import validate_username


class ReworkedUser(AbstractUser):
    """Модель юзера с отредактированными полями."""

    email = models.EmailField(max_length=settings.EMAIL_MAX_LENGTH, unique=True)
    username = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
        error_messages={
            'unique': _("A user with that username already exists."),
        },
        validators=[
            UnicodeUsernameValidator(),
            validate_username,
        ]
    )
    first_name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        blank=True,
        validators=[
            validate_username,
        ],
    )
    last_name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        blank=True,
        validators=[
            validate_username,
        ],
    )



    class Meta:
        ordering = ['-id']
