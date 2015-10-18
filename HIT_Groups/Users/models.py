from django.db import models
from Groups.models import Group


# Create your models here.
class User(models.Model):
    """
    Description: User Description
    """
    name = models.CharField()
    email = models.EmailField()
    # password
    # headimage

    groups = models.ManyToManyField(Group, through="UsersAndGroups")


class UsersAndGroups(models.Model):
    """
    Description: For many to many relationship and User Authority Description
    """

    user_id = models.ForeignKey(User)
    group_id = models.ForeignKey(Group)
    user_role = models.CharField(choices=
                                 (('Creator', 'Creator'),
                                  ("Admin", "Admin"),
                                  ("User", "User")), default="User")
