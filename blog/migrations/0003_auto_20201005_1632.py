# Generated by Django 2.0.7 on 2020-10-05 16:32

from django.db import migrations
import mdeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20201004_1521'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blog',
            name='content',
            field=mdeditor.fields.MDTextField(help_text='博客内容', verbose_name='博客内容'),
        ),
    ]
