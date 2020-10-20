from django.shortcuts import render


# Create your views here.

def show_video(request):
    context = {}
    return render(request, "show_video.html")
