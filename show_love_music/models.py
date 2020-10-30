from django.db import models


# Create your models here.


class Musician(models.Model):
    name = models.CharField(max_length=20, verbose_name="姓名", help_text="歌手名称")
    info = models.TextField(verbose_name="歌手简介")
    image = models.URLField(verbose_name="歌手头像")

    def get_musics(self):
        return Music_info.objects.filter(pk=self.id)

    def __str__(self):
        return self.name


class Music_info(models.Model):
    name_music = models.CharField(max_length=40, verbose_name="歌曲名称", help_text="歌曲名称")
    url_music = models.URLField(verbose_name="歌曲链接")
    musician_name = models.ForeignKey(to=Musician, to_field='id', on_delete=models.CASCADE, verbose_name="作者id")

    def __str__(self):
        return self.musician_name
