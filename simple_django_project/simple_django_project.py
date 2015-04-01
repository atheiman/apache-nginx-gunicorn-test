import os
import sys



from django.conf import settings

DEBUG = os.environ.get('DEBUG', 'on') == 'on'

SECRET_KEY = os.environ.get('SECRET_KEY', '@f63+(z17@7sq5r1-mo5#-qmdl!^!x3yc1hlsb#we!4*4&1cj1')

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', 'localhost').split(',')

settings.configure(
    DEBUG=DEBUG,
    SECRET_KEY=SECRET_KEY,
    ALLOWED_HOSTS=ALLOWED_HOSTS,
    ROOT_URLCONF=__name__,
    MIDDLEWARE_CLASSES=(
        'django.middleware.common.CommonMiddleware',
        'django.middleware.csrf.CsrfViewMiddleware',
        'django.middleware.clickjacking.XFrameOptionsMiddleware',
    ),
)



from django.conf.urls import url
from django.http import HttpResponse

# Views
def index(req):
    return HttpResponse(
        "Django answers the call to {}\n".format(req.build_absolute_uri())
    )

# URLs
urlpatterns = (
    url(r'^.*$', index),
)



from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()



# Allow to be run from command line like so:
# python simple_django_project.py runserver
if __name__ == "__main__":
    from django.core.management import execute_from_command_line
    execute_from_command_line(sys.argv)
