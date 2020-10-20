from django.shortcuts import render

# Create your views here.

def show_photos(request):
    context={}
    return render(request,'photos.html',context)