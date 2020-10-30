# Generated by Django 2.2.16 on 2020-10-30 19:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Musician',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='歌手名称', max_length=20, verbose_name='姓名')),
                ('info', models.TextField(verbose_name='歌手简介')),
                ('image', models.URLField(verbose_name='歌手头像')),
            ],
        ),
        migrations.CreateModel(
            name='Music_info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name_music', models.CharField(help_text='歌曲名称', max_length=40, verbose_name='歌曲名称')),
                ('url_music', models.URLField(verbose_name='歌曲链接')),
                ('musician_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='show_love_music.Musician', verbose_name='作者id')),
            ],
        ),
    ]
