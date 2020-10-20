from django.db import models
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.contenttypes.fields import GenericRelation
from read_statistic.models import ReadNumExpandMethod,ReadDetail

class BlogType(models.Model):
    class Meta:
        verbose_name='博客标签'
        verbose_name_plural='博客标签'
    type_name = models.CharField(max_length=15,verbose_name='标签名称',help_text='博客类型')

    def __str__(self):
        return self.type_name

class Blog(models.Model,ReadNumExpandMethod):

    class Meta:
        ordering=['-created_time']
    title = models.CharField(max_length=50,verbose_name='标题',help_text='标题')
    blog_type = models.ForeignKey(BlogType, on_delete=models.CASCADE,verbose_name='博客类型',help_text='博客类型')
    content = RichTextUploadingField(verbose_name='博客内容',help_text='博客内容')
    author = models.ForeignKey(User, on_delete=models.CASCADE,verbose_name='作者',help_text='博客作者')
    created_time = models.DateTimeField(auto_now_add=True,help_text='创建时间')
    last_updated_time = models.DateTimeField(auto_now=True,help_text='更新时间')
    read_details=GenericRelation(ReadDetail)

    def __str__(self):
        return "<Blog: %s>" % self.title

# class ReadNum(models.Model):
#     read_number=models.IntegerField(default=0,help_text="阅读数")
#     blog=models.OneToOneField(Blog,on_delete=models.CASCADE)