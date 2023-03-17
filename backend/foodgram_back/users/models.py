from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from django.utils.translation import gettext_lazy as _


class CustomUserManager(UserManager):
    def create_superuser(self, username, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        return super().create_superuser(username, email, password, **extra_fields)


class User(AbstractUser):
    objects = CustomUserManager()
    
    login = models.CharField(
        max_length=150,
        verbose_name='Логин',
        help_text='Придумайте себе имя'
    )
    password = models.CharField(_('password'), max_length=128)
    email = models.EmailField(
        max_length=254,
        verbose_name='Почтовый ящик',
        help_text='Введите свой почтовый адрес'
    )
    name = models.CharField(
        max_length=150,
        verbose_name='Ваше имя',
        help_text='Введите свое имя',
        null=False,
        blank=False
    )
    surname = models.CharField(
        max_length=150,
        verbose_name='Фамилия',
        help_text='Введите свою фамилию',
        null=False,
        blank=False
    )
