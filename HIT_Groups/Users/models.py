from django.db import models
from django.contrib.auth.models import AbstractUser
from Groups.models import Group

# Create your models here.
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
