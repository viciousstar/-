__author__ = 'jinyiyexing'

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.group_index, name='index'),
]