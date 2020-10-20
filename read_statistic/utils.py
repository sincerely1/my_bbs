import datetime
from django.utils import timezone
from django.db.models import Sum
from django.contrib.contenttypes.models import ContentType
from .models import ReadNum,ReadDetail


def read_statistic_once_read(request,obj):
    ct=ContentType.objects.get_for_model(obj)
    key="%s_%s_read"%(ct.model,obj.pk)
    if not request.COOKIES.get(key):

        readnum,created = ReadNum.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readnum.read_number += 1
        readnum.save()

        date=timezone.now().date()
        read_detail, created=ReadDetail.objects.get_or_create(content_type=ct,object_id=obj.pk,date=date)
        read_detail.read_number+=1
        read_detail.save()
    return key

# def get_seven_days_read_data(content_type):
#     today=timezone.now().date()
#     dates=[]
#     read_nums=[]
#     for i in range(7,-1,-1):
#         date=today-datetime.timedelta(days=i)
#         dates.append(date.strftime('%m月%d'))
#         read_details=ReadDetail.objects.filter(content_type=content_type,date=date)
#         result=read_details.aggregate(read_num_sum=Sum('read_number'))
#         print(result)
#         print(read_details)
#         print(content_type)
#         print(date)
#         read_nums.append(result['read_num_sum'] or 0)
#     return dates,read_nums
def get_seven_days_read_data(content_type):
    today = timezone.now().date()
    dates = []
    read_nums = []
    for i in range(7, -1, -1):
        date = today - datetime.timedelta(days=i)
        dates.append(date.strftime('%m/%d'))
        read_details = ReadDetail.objects.filter(date=date,content_type=content_type)
        result = read_details.aggregate(read_num_sum=Sum('read_number'))
        read_nums.append(result['read_num_sum'] or 0)
    return dates, read_nums

