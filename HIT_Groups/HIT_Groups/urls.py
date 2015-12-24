from django.conf.urls import include, url, static
from django.contrib import admin
from django.contrib.auth import views
from Users import views as user_views
from Posts import views as post_views
from . import settings


urlpatterns = [
    url(r'^groups/', include('Groups.urls', namespace="Groups")),
    url(r'^users/', include('Users.urls', namespace="Users")),
    url(r'^posts/', include('Posts.urls', namespace='Posts')),
    url(r'^admin/', include(admin.site.urls)),
    url(r"^$", user_views.root, name="root"),
    url(r"^login/$", views.login, {"template_name": "Users/login.html"}, name="login"),
    url(r"^logout/$", user_views.logout, name="logout"),
    url(r"^signup/$", user_views.signup, name="signup"),
    url(r'^messages/', include('django_messages.urls')),
    url(r'^feedreader/', include('feedreader.urls', namespace='feedreader')),
    url(r"^changepassword/$", views.password_change, {"post_change_redirect": settings.LOGIN_URL}, name="change_password"),
    ]

urlpatterns += static.static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
