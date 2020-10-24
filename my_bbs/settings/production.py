from .base import *

DEBUG = False
SECRET_KEY = '1mfl8y=qg$c#x&*cl*3o=u7m2#$3*ncw$j4!9%kxes1b@bi&1s'
ALLOWED_HOSTS = ['*']

# 日志文件
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/home/my_bbs_debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': False,
        },
    },
}