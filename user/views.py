from django.http import JsonResponse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import LoginForm, RegisterForm
from django.contrib.auth import login, authenticate, logout


def login_account(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForm()
    context = {'login_form': login_form}
    return render(request, 'login.html', context)


def register_account(request):
    if request.method == 'POST':
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            email = register_form.cleaned_data['email']
            password = register_form.cleaned_data['password']
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        register_form = RegisterForm()
    context = {'register_form': register_form}
    return render(request, 'register.html', context)


def medal_login(request):
    login_form = LoginForm(request.POST)
    data = {}
    if login_form.is_valid():
        user = login_form.cleaned_data['user']
        login(request, user)
        data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'

    return JsonResponse(data=data)


def user_info(request):
    context = {}
    return render(request, "user_info.html", context)


def logout_account(request):
    logout(request)
    return redirect(request.GET.get('from'), reverse('home'))
