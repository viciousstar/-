from django.contrib import admin
from .models import MyUser, UsersAndGroups
# Register your models here.
admin.site.register(MyUser)
admin.site.register(UsersAndGroups)

