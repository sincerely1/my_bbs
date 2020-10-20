
from django.urls import path
from .views import blog_with_type,blog_detail,blog_list,blogs_with_date
urlpatterns = [
   path('',blog_list,name="blog_list"),
   path('detail/<int:blog_pk>',blog_detail,name="blog_detail"),
   path('type/<int:blog_type_pk>',blog_with_type,name="blog_with_type"),
   path('date/<int:year>/<int:month>/',blogs_with_date,name="blogs_with_date"),
]