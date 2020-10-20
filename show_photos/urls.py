
from django.urls import path
from .views import show_photos
urlpatterns = [
   path('photos/',show_photos,name="show_photos"),

]