from django.conf.urls import include, url
from django.contrib import admin
from Users import views as user_views
from django.contrib.auth import views

template_name = {'template_name': 'Users/login.html'}

urlpatterns = [
    url(r'^groups/', include('Groups.urls', namespace="Groups")),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^users/$', user_views.UserList.as_view()),
    url(r'^users/(?P<pk>[0-9]+)/$', user_views.UserDetail.as_view()),
    url(r'^login/$', views.login, template_name, name='login'),
    url(r'^logout/$', views.logout, template_name, name='logout'),

]
