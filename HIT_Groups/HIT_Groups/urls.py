
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^groups/', include('Groups.urls',namespace="Groups")),
    url(r'^admin/', include(admin.site.urls)),
]
