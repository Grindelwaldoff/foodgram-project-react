# Generated by Django 3.2 on 2023-06-27 12:06

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('recipes', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='recipe',
            name='author',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='recipes', to=settings.AUTH_USER_MODEL, verbose_name='Создатель рецепта:'),
        ),
        migrations.AddField(
            model_name='recipe',
            name='tags',
            field=models.ManyToManyField(help_text='Выберите из списка', related_name='recipes', to='recipes.Tags', verbose_name='Тэги:'),
        ),
        migrations.AddField(
            model_name='ingredientstorecipe',
            name='ingredient',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='+', to='recipes.ingredients', verbose_name='Ингредиент:'),
        ),
        migrations.AddField(
            model_name='ingredientstorecipe',
            name='recipe',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='ingredients', to='recipes.recipe', verbose_name='Рецепт:'),
        ),
        migrations.AddField(
            model_name='favorites',
            name='recipe',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='favorites', to='recipes.recipe', verbose_name='Рецепт:'),
        ),
        migrations.AddField(
            model_name='favorites',
            name='user',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL, verbose_name='Пользователь:'),
        ),
        migrations.AddField(
            model_name='basket',
            name='recipe',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='basket', to='recipes.recipe', verbose_name='Рецепт:'),
        ),
        migrations.AddField(
            model_name='basket',
            name='user',
            field=models.ForeignKey(help_text='Выберите из списка', on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL, verbose_name='Пользователь:'),
        ),
        migrations.AlterUniqueTogether(
            name='ingredientstorecipe',
            unique_together={('recipe', 'ingredient')},
        ),
        migrations.AlterUniqueTogether(
            name='favorites',
            unique_together={('recipe', 'user')},
        ),
        migrations.AlterUniqueTogether(
            name='basket',
            unique_together={('user', 'recipe')},
        ),
    ]
