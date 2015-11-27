from django.db import models
from Users.models import MyUser
from Groups.models import Group

from django.utils import timezone


class Tag(models.Model):
    name = models.CharField(max_length = 20)
    # parent = models.ForeignKey('self')


class Post(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'post_author')
    users_like = models.ManyToManyField(MyUser, related_name = 'post_users_like', through='UsersLike')
    #tag = models.ManyToManyField(Tag, related_name = 'postoftag')
    users_mentioned = models.ManyToManyField(MyUser, related_name = 'post_users_mentioned')
    starred = models.ManyToManyField(MyUser, related_name = 'post_starred')
    group = models.ForeignKey(Group, related_name = 'post_group')
    posted_time = models.DateTimeField(default=timezone.now())

                                  
class UsersLike(models.Model):
    user = models.ForeignKey(MyUser)
    post = models.ForeignKey(Post)


