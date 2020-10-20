
from django.urls import path
from .views import show_video
urlpatterns = [
   path('show_video/',show_video,name="show_video"),

]