from django.contrib import admin
from django.urls import path, include
from .views import *

urlpatterns = [
    path('login/', login_account, name="login"),
    path('medal_login/', medal_login, name="medal_login"),
    path('register/', register_account, name='register'),
    path('user_info/', user_info, name='user_info'),
    path('logout/', logout_account, name='logout'),
]
