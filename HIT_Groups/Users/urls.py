from django.conf.urls import url

from .views import UserUpdate

urlpatterns = [
    url(r'^(?P<pk>[0-9]+)$', UserUpdate.as_view()),
]