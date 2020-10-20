from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from .models import MyUser


# Register your models here.
class ProfileInline(admin.StackedInline):
    model = MyUser
    can_delete = False


class UserAdmin(BaseUserAdmin):
    inlines = (ProfileInline,)
    list_display = ('username', 'pretty_name', 'email', 'is_staff', 'is_active', 'is_superuser')

    def pretty_name(self, obj):
        return obj.myuser.pretty_name

    pretty_name.short_description = '昵称'


# Re-register UserAdmin
admin.site.unregister(User)
admin.site.register(User, UserAdmin)


@admin.register(MyUser)
class MyUserAdmin(admin.ModelAdmin):
    list_display = ['user', 'pretty_name']
