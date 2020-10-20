import datetime
from django.contrib.contenttypes.models import ContentType
from django.core.cache import cache
from django.db.models import Sum
from django.shortcuts import render
from django.utils import timezone

from blog.models import Blog
from read_statistic.utils import get_seven_days_read_data


def get_seven_days_hot_blogs():
    today = timezone.now().date()
    date = today - datetime.timedelta(days=7)
    blogs = Blog.objects \
        .filter(read_details__date__lte=today, read_details__date__gte=date) \
        .values('id', 'title') \
        .annotate(read_num_sum=Sum('read_details__read_number')) \
        .order_by('-read_num_sum')
    return blogs[:5]


def get_today_hot_data():
    today = timezone.now().date()
    read_details = Blog.objects.filter(read_details__date=today).values('title', 'id')
    return read_details[:5]


def get_yesterday_hot_data():
    today = timezone.now().date()
    date = today - datetime.timedelta(days=1)
    read_details = Blog.objects.filter(read_details__date=date).values('title', 'id')
    print(read_details)
    return read_details[:5]


def home(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    dates, read_nums = get_seven_days_read_data(blog_content_type)
    seven_day_hot_date = cache.get('seven_day_hot_date')
    if seven_day_hot_date is None:
        seven_day_hot_date = get_seven_days_hot_blogs()
        cache.set('seven_day_hot_date', seven_day_hot_date, 3600)

    context = {'dates': dates, 'read_nums': read_nums, 'today_hot_date': get_today_hot_data(),
               'seven_day_hot_date': seven_day_hot_date, 'yesterday_hot_date': get_yesterday_hot_data()}
    return render(request, 'home.html', context)



