__author__ = 'jinyiyexing'

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.GroupsIndex, name='GroupsIndex'),
    url(r'^(?P<group_id>[0-9]+)/$',views.GroupDetail,name="GroupDetail"),
    url(r'^(?P<group_id>[0-9]+)/modify/$',views.GroupModify,name="GroupModify"),
    url(r'^create/$',views.GroupCreate,name="GroupCreate"),
    url(r'^(?P<group_id>[0-9]+)/delete/$',views.GroupDelete,name="GroupDelete"),
    url(r'^(?P<group_id>[0-9]+)/add/$',views.AddUser,name="GroupAdd"),
    url(r'^(?P<group_id>[0-9]+)/leave/$',views.EraseUser,name="GroupLeave"),
]
