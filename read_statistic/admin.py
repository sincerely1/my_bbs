# Register your models here.
from django.contrib import admin
from .models import ReadNum,ReadDetail

@admin.register(ReadNum)
class ReadNumAdmin(admin.ModelAdmin):
    list_display = ['id','read_number','content_type','object_id']

@admin.register(ReadDetail)
class ReadDetailAdmin(admin.ModelAdmin):
    list_display = ('date','read_number', 'content_type','object_id')