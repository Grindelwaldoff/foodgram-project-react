from django.db import models
from django.conf import settings
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

from users.validators import naming_validator_no_nums


class ReworkedUser(AbstractUser):
    """Модель юзера с отредактированными полями."""

    email = models.EmailField(
        max_length=settings.EMAIL_MAX_LENGTH,
        unique=True
    )
    username = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
        error_messages={
            'unique': _("A user with that username already exists."),
        },
        validators=[
            UnicodeUsernameValidator(),
        ]
    )
    first_name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        blank=True,
        validators=[
            naming_validator_no_nums
        ],
    )
    last_name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        blank=True,
        validators=[
            naming_validator_no_nums
        ],
    )

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'last_name', 'first_name']

    class Meta:
        ordering = ['-id']


class Subscriptions(models.Model):
    author = models.ForeignKey(
        ReworkedUser,
        on_delete=models.CASCADE,
        related_name='author'
    )
    sub = models.ForeignKey(
        ReworkedUser,
        on_delete=models.ForeignKey,
        related_name='sub'
    )

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['author', 'sub'],
                name='unique_follow'
            ),
            models.CheckConstraint(
                check=~models.Q(sub=models.F('author')),
                name='its_not_allowed_to_follow_on_yourself'
            )
        ]
        ordering = ['-id']
