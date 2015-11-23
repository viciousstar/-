from django.db import models
from django.contrib.auth.models import AbstractUser
from Groups.models import Group

# Create your models here.
class UsersAndGroups(models.Model):
    """
    Description: For many to many relationship and User Authority Description

    Todo:
        raw level authority
    """

    user_id = models.ForeignKey(MyUser)
    group_id = models.ForeignKey(Group)
    user_role = models.CharField(choices=
                                 (('Creator', 'Creator'),
                                  ("Admin", "Admin"),
                                  ("User", "User")), default="User", max_length = 20)

class MyUser(AbstractUser):
    """
    Description: User Description

    Todo:
        description
        tag
    """
    my_groups = models.ManyToManyField(Group, through = "UsersAndGroups")
    # password
    # headimage
    def has_role_creator(self, group):
        return True if \
            UsersAndGroups.objects.filter(user_id = self, group_id = group, user_role="Creator") \
            else False

    def has_role_admin(self, group):
        return True if \
            UsersAndGroups.objects.filter(user_id = self, group_id = group, user_role="Admin") \
            else False

    def has_role_user(self, group):
        return True if \
            UsersAndGroups.objects.filter(user_id = self, group_id = group, user_role="User") \
            else False

    def can_modify(self, obj):
        if obj.creator() == self:
            return True
        else:
            return False

