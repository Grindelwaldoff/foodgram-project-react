from django_base64field.fields import Base64Field
from django.db import models
from django.contrib.auth import get_user_model


User = get_user_model()


class Tags(models.Model):
    """Класс модели тэгов."""

    name = models.CharField(
        max_length=100,
        unique=True
    )
    color = models.CharField(
        max_length=50,
        unique=True
    )
    slug = models.CharField(
        max_length=150,
        unique=True
    )

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.name


class Ingredients(models.Model):
    """Класс модели ингредиентов."""

    name = models.CharField(
        max_length=150,
        unique=True,
    )
    measurement_unit = models.CharField(
        max_length=50,
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
        max_length=150,
    )
    img = Base64Field()
    description = models.CharField(
        max_length=400,
    )
    tags = models.ForeignKey(
        Tags,
        related_name='recipes',
        on_delete=models.DO_NOTHING
    )
    time_to_cook = models.IntegerField()

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.name


class IngredientsToRecipe(models.Model):
    """Класс модели, описывающей кол-во ингредиентов для рецептов."""

    recipe = models.ForeignKey(
        Recipe,
        related_name='ingredients',
        on_delete=models.DO_NOTHING
    )
    ingredient = models.ForeignKey(
        Ingredients,
        on_delete=models.DO_NOTHING,
        related_name='recipe'
    )
    amount = models.IntegerField()

    def __str__(self):
        return self.ingredient.name


class ToBuyList(models.Model):
    pass


class Favorites(models.Model):
    recipe = models.ForeignKey(
        Recipe,
        related_name='favorites',
        on_delete=models.CASCADE,
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='favorites',
    )

    class Meta:
        unique_together = ['recipe', 'user']


class Subscriptions(models.Model):
    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='author'
    )
    sub = models.ForeignKey(
        User,
        on_delete=models.ForeignKey,
        related_name='sub'
    )
