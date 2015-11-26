from django.conf.urls import include, url, static
from django.contrib import admin
from Users import views as user_views
from django.contrib.auth import views
from . import settings

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
    # url(r'^media/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.MEDIA_ROOT}),
]

urlpatterns += static.static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
