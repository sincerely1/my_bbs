from django.db import models
from django.contrib.auth.models import User


# Create your models here.

class MyUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    pretty_name = models.CharField(max_length=20, verbose_name="昵称")

    def __str__(self):
        return "%s 昵称：%s" % (self.user.username, self.pretty_name)
