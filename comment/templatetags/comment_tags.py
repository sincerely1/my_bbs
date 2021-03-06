from django import template
from django.contrib.contenttypes.models import ContentType
from ..models import Comment
from ..forms import CommentForm
from likes.models import Like
from show_love_music.models import Music_info

register = template.Library()


@register.simple_tag
def get_comment_count(obj):
    content_type = ContentType.objects.get_for_model(obj)
    return Comment.objects.filter(content_type=content_type, object_id=obj.pk).count()


@register.simple_tag
def get_comment_form(obj):
    content_type = ContentType.objects.get_for_model(obj)
    form = CommentForm(
        initial={"content_type": content_type.model, 'object_id': obj.pk, 'reply_comment_id': '0'})
    return form


@register.simple_tag
def get_comment_list(obj):
    content_type = ContentType.objects.get_for_model(obj)
    comments = Comment.objects.filter(content_type=content_type, object_id=obj.pk, parent=None)
    return comments.order_by('-comment_time')


@register.simple_tag
def get_context_type(obj):
    content_type = ContentType.objects.get_for_model(obj)
    return content_type


@register.simple_tag
def get_likes_num(obj):
    content_type = ContentType.objects.get_for_model(obj)
    return Like.objects.filter(content_type=content_type, object_id=obj.pk).count()


@register.simple_tag
def get_musics(obj):
    return Music_info.objects.filter(id=obj.pk)
