from django.core.paginator import Paginator
from django.shortcuts import get_object_or_404, render
from read_statistic.utils import read_statistic_once_read
from .models import BlogType, Blog
from user.forms import LoginForm

EACH_PAGE_BLOGS = 12


# Create your views here.

def get_paginator_range(request, blogs):
    page_num = request.GET.get('page', 1)
    paginator = Paginator(blogs, EACH_PAGE_BLOGS)
    page_of_blogs = paginator.get_page(page_num)
    page_range = [x for x in range(int(page_num) - 3, int(page_num) + 4) if x in paginator.page_range]
    # 加上省略页码标记
    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    # 加上首页和尾页
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)

    context = {}
    context['blogs'] = page_of_blogs.object_list
    context['page_range'] = page_range
    context['page_of_blogs'] = page_of_blogs
    #context['blog_dates'] = Blog.objects.dates('created_time', 'month', order="DESC")
    return context


def blog_list(request):
    blogs = Blog.objects.all()
    context = get_paginator_range(request, blogs)
    context['blog_types'] = BlogType.objects.all()
    return render(request, 'blog/blog_list.html', context)


def blog_with_type(request, blog_type_pk):
    blog_type = get_object_or_404(BlogType, pk=blog_type_pk)
    blogs = Blog.objects.filter(blog_type=blog_type)
    context = get_paginator_range(request, blogs)
    context['blog_type'] = blog_type
    context['blog_types'] = BlogType.objects.all()
    return render(request, 'blog/blog_with_type.html', context)


def blogs_with_date(request, year, month):
    blogs = Blog.objects.filter(created_time__year=year, created_time__month=month)
    context = get_paginator_range(request, blogs)
    context['blog_types'] = BlogType.objects.all()
    context['blogs_with_date'] = '%s年%s月' % (year, month)
    return render(request, 'blog/blogs_with_date.html', context=context)


def blog_detail(request, blog_pk):
    context = {}
    blog = get_object_or_404(Blog, pk=blog_pk)
    read_cookie_key = read_statistic_once_read(request, blog)
    context['previous_blog'] = Blog.objects.filter(created_time__gt=blog.created_time).last()
    context['next_blog'] = Blog.objects.filter(created_time__lt=blog.created_time).first()
    context['blog'] = blog
    context["content"] = blog.content
    context["login_form"] = LoginForm()
    response = render(request, 'blog/blog_detail.html', context)
    response.set_cookie(read_cookie_key, 'true')
    return response
