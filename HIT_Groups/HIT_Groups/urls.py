from django.conf.urls import include, url
from django.contrib import admin
from Users import views as user_views
from django.contrib.auth import views

urlpatterns = [
    url(r'^groups/', include('Groups.urls', namespace="Groups")),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^users/$', user_views.UserList.as_view()),
    url(r'^users/(?P<pk>[0-9]+)/$', user_views.UserDetail.as_view()),
    url(r"^$", user_views.root),
    url(r"^login/$", user_views.login),
    url(r"^logout/$", user_views.logout)

]

urlpatterns += [
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
]
