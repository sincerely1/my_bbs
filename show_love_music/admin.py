from django.contrib import admin
from .models import *


# Register your models here.
@admin.register(Musician)
class MusicianAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']


@admin.register(Music_info)
class MusicianAdmin(admin.ModelAdmin):
    list_display = ['id', 'name_music', 'musician_name']
