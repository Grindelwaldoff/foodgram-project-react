# Generated by Django 3.2 on 2023-04-01 08:48

import colorfield.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0019_alter_tags_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tags',
            name='color',
            field=colorfield.fields.ColorField(default='#FFFFFF', image_field=None, max_length=18, samples=None),
        ),
    ]
