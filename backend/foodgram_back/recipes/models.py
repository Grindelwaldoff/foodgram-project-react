from colorfield.fields import ColorField
from django.conf import settings
from django.core.validators import MinValueValidator
from django.db import models
from django.contrib.auth import get_user_model

from users.validators import validate_username


User = get_user_model()


class Tags(models.Model):
    """Класс модели тэгов."""

    name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True
    )
    color = ColorField()
    slug = models.SlugField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True
    )

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.name


class Ingredients(models.Model):
    """Класс модели ингредиентов."""

    name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
    )
    measurement_unit = models.CharField(
        max_length=settings.MEASURE_MAX_LENGTH,
    )

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.name


class Recipe(models.Model):
    """Класс модели рецептов."""

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='recipes',
    )
    name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        validators=[
            validate_username
        ]
    )
    img = models.ImageField(
        upload_to='recipes/'
    )
    description = models.CharField(
        max_length=settings.DESC_MAX_LENGTH,
    )
    tags = models.ManyToManyField(
        Tags,
        related_name='recipes',
    )
    time_to_cook = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(5)]
    )

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.name


class IngredientsToRecipe(models.Model):
    """Класс модели, описывающей кол-во ингредиентов для рецептов."""

    recipe = models.ForeignKey(
        Recipe,
        related_name='ingredients',
        on_delete=models.CASCADE
    )
    ingredient = models.ForeignKey(
        Ingredients,
        on_delete=models.CASCADE,
        related_name='+'
    )
    amount = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(10)]
    )

    class Meta:
        unique_together = ['recipe', 'ingredient']

    def __str__(self):
        return self.ingredient.name


class Basket(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE,
        related_name='basket'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='+'
    )

    def __str__(self):
        return self.user.username

    class Meta:
        unique_together = ['user', 'recipe']
        ordering = ['-id']


class Favorites(models.Model):
    recipe = models.ForeignKey(
        Recipe,
        related_name='favorites',
        on_delete=models.CASCADE,
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='+',
    )

    class Meta:
        unique_together = ['recipe', 'user']
        ordering = ['-id']
