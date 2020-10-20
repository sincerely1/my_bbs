from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.auth.models import User


class Comment(models.Model):
    class Meta:
        ordering = ['-comment_time']

    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, verbose_name='类型')
    object_id = models.PositiveIntegerField(verbose_name='id')
    content_object = GenericForeignKey('content_type', 'object_id')

    text = models.TextField(max_length=250, verbose_name='评论')
    comment_time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(to=User, related_name='comments', on_delete=models.CASCADE)

    root = models.ForeignKey('self', related_name='root_comment', null=True, blank=True, on_delete=models.CASCADE)
    parent = models.ForeignKey('self', related_name='patent_comment', null=True, blank=True,
                               on_delete=models.DO_NOTHING)
    reply_to = models.ForeignKey(User, related_name='replies', null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        return "阅读%s%s:%s" % (self.content_type, self.object_id, self.text)
