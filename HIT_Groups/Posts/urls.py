from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.post_index, name='post_index'),
    url(r'^(?P<post_id>[0-9]+)/modify/$', views.post_update, name='post_update'),
    url(r'^create/$', views.post_create,name='post_create'),
    url(r'^(?P<post_id>[0-9]+)/delete/$', views.post_delete, name='post_delete'),
    url(r'^(?P<post_id>[0-9]+)/reply$', views.post_reply, name='post_reply')
]