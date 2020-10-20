from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from .models import LikeRecord, Like
from django.http import JsonResponse
from django.db.models import ObjectDoesNotExist


# Create your views here.
def ErrorResponse(code, message):
    data = {'status': 'ERROR', 'code': code, 'message': message}
    return JsonResponse(data)


def SuccessResponse(liked_num, is_like):
    data = {'status': 'SUCCESS', 'liked_num': liked_num, 'is_like': is_like}
    return JsonResponse(data)


def like_change(request):
    user = request.user
    print(user)
    # 验证是否登录

    if not user.is_authenticated:
        return ErrorResponse(400, "you not login")

    content_type = request.GET.get('content_type')
    object_id = request.GET.get('object_id')

    # 验证数据是否存在
    try:
        content_type = ContentType.objects.get(model=content_type)
        model_class = content_type.model_class()
        model_obj = model_class.objects.get(pk=object_id)
    except ObjectDoesNotExist:
        return ErrorResponse(404, "评论对象不存在")

    like_record, created = LikeRecord.objects.get_or_create(content_type=content_type, object_id=object_id,
                                                            user=user)
    if created:
        # 未点赞过，进行点赞
        like_count, created = Like.objects.get_or_create(content_type=content_type, object_id=object_id)
        like_count.liked_num += 1
        like_count.save()
        return SuccessResponse(like_count.liked_num, True)
    else:
        like_record.delete()
        like_count, created = Like.objects.get_or_create(content_type=content_type, object_id=object_id)
        if not created:
            like_count.liked_num -= 1
            like_count.save()
            return SuccessResponse(like_count.liked_num, False)
        else:
            return ErrorResponse(404, 'data error')
