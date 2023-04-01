# Generated by Django 3.2 on 2023-04-01 08:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0020_alter_tags_color'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ingredientstorecipe',
            name='ingredient',
            field=models.ForeignKey(default='ingredient__name', on_delete=django.db.models.deletion.SET_DEFAULT, related_name='+', to='main.ingredients'),
        ),
    ]
