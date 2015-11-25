from django.conf.urls import include, url
from django.contrib import admin
from Users import views as user_views
from django.contrib.auth import views

urlpatterns = [
    url(r'^groups/', include('Groups.urls', namespace="Groups")),
    url(r'^users/', include('Users.urls', namespace="Users")),
    url(r'^groups/(?P<group_id>[0-9]+)/posts/', include('Posts.urls', namespace='Posts')),
    url(r'^admin/', include(admin.site.urls)),
    url(r"^$", user_views.root),
    url(r"^login/$", user_views.login),
    url(r"^logout/$", user_views.logout),
    url(r"^signup/$", user_views.signup),
    url(r'^messages/', include('django_messages.urls')),
]

