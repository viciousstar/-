__author__ = 'jinyiyexing'

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.GroupsIndex, name='GroupIndex'),
    url(r'^(?P<group_id>[0-9]+)/$', views.GroupDetail, name='GroupDetail'),

]
