from django.db import models
from django.db.models.fields import exceptions
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.utils import timezone


class ReadNum(models.Model):
    read_number = models.IntegerField(default=0, help_text="阅读数", verbose_name='阅读数')
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, verbose_name='类型')
    object_id = models.PositiveIntegerField(verbose_name='id')
    content_object = GenericForeignKey('content_type', 'object_id')

    def __str__(self):
        return "阅读%s%s:%d" % (self.content_type, self.object_id, self.read_number)


class ReadNumExpandMethod():

    def get_read_num(self):
        try:
            ct = ContentType.objects.get_for_model(self)
            read_num = ReadNum.objects.get(content_type=ct, object_id=self.pk)
            return read_num.read_number
        except exceptions.ObjectDoesNotExist:
            return 0


class ReadDetail(models.Model):
    date = models.DateField(default=timezone.now, verbose_name="时间")
    read_number = models.IntegerField(default=0, verbose_name="阅读数量")
    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING, verbose_name="类型")
    object_id = models.PositiveIntegerField(verbose_name="id")
    content_object = GenericForeignKey('content_type', 'object_id')
