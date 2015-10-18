from django.db import models
from Groups.models import Groups
from django.contrib.auth.models import AbstractUser
# Create your models here.
class MyUser(AbstractUser):
    """
    Description: User Description
    
    Todo:
        description
        tag
    """
    groups = models.ManyToManyField(Group, through = "UsersAndGroups")

class UsersAndGroups(models.Model):
    """
    Description: For many to many relationship and User Authority Description
    
    Todo:
        raw level authority
    """

    user_id = models.ForeignKey(User) 
    group_id = models.ForeignKey(Group)
    user_role = models.CharField(choices = 
                                (('Creator', 'Creator'),
                                    ("Admin", "Admin"),
                                    ("User", "User")), default="User")

