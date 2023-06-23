from colorfield.fields import ColorField
from django.conf import settings
from django.core.validators import MinValueValidator, RegexValidator
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth import get_user_model


User = get_user_model()


class Tags(models.Model):
    """Класс модели тэгов."""

    name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
        verbose_name="Название:",
        help_text="Введите значение",
        validators=[
            RegexValidator(
                regex=r'^[a-zA-Z0-9]*$',
                message=_(
                    'Название тэга должно содержать '
                    'только буквы и цифры',
                )
            ),
        ]
    )
    color = ColorField(
        verbose_name='Цвет тэга:',
        help_text='Выберите понравившийся из палитры'
    )
    slug = models.SlugField(
        max_length=settings.NAME_MAX_LENGTH,
        unique=True,
        verbose_name='Название в ссылки на тэг:',
        help_text='Рекомендуется вводить название переведенное на английский*'
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
        verbose_name="Название:",
        help_text="Введите значение",
    )
    measurement_unit = models.CharField(
        max_length=settings.MEASURE_MAX_LENGTH,
        verbose_name='Ед. измерения:',
        help_text='Укажите единицу измерения ингредиента (г, кг, мл, л и тд)'
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
        verbose_name='Создатель рецепта:',
        help_text='Выберите из списка'
    )
    name = models.CharField(
        max_length=settings.NAME_MAX_LENGTH,
        validators=[
            RegexValidator(
                regex=r'^[a-zA-Z0-9]*$',
                message=_(
                    'Название рецепта должно содержать '
                    'только буквы и цифры',
                ),
            ),
        ],
        verbose_name="Название:",
        help_text="Введите значение",
    )
    img = models.ImageField(
        upload_to='recipes/',
        verbose_name='Изображении рецепта:',
        help_text='Загрузите изображение'
    )
    description = models.CharField(
        max_length=settings.DESC_MAX_LENGTH,
        verbose_name='Описание:',
        help_text='Укажите основные этапы готовки'
    )
    tags = models.ManyToManyField(
        Tags,
        related_name='recipes',
        verbose_name='Тэги:',
        help_text='Выберите из списка'
    )
    time_to_cook = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(3)],
        help_text='Введите значение',
        verbose_name='Время приготовления:'
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
        on_delete=models.CASCADE,
        verbose_name='Рецепт:',
        help_text='Выберите из списка'
    )
    ingredient = models.ForeignKey(
        Ingredients,
        on_delete=models.CASCADE,
        related_name='+',
        verbose_name='Ингредиент:',
        help_text='Выберите из списка'
    )
    amount = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(10)],
        verbose_name='Кол-во:',
        help_text='Введите кол-во игредиента (гр, л, мл и тд.)'
    )

    class Meta:
        unique_together = ['recipe', 'ingredient']

    def __str__(self):
        return self.ingredient.name


class Basket(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE,
        related_name='basket',
        verbose_name='Рецепт:',
        help_text='Выберите из списка'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='+',
        verbose_name='Пользователь:',
        help_text='Выберите из списка'
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
        verbose_name='Рецепт:',
        help_text='Выберите из списка'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='+',
        verbose_name='Пользователь:',
        help_text='Выберите из списка'
    )

    class Meta:
        unique_together = ['recipe', 'user']
        ordering = ['-id']
