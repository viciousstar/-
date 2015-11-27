from django.db import models
from Users.models import MyUser
from Groups.models import Group


class Tag(models.Model):
    name = models.CharField(max_length = 20)
    # parent = models.ForeignKey('self')


class Post(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'post_author')
    user_like = models.ManyToManyField(MyUser, related_name = 'post_users_like', through='UsersLike')
    #tag = models.ManyToManyField(Tag, related_name = 'postoftag')
    user_mentioned = models.ManyToManyField(MyUser, related_name = 'post_users_mentioned')
    starred = models.ManyToManyField(MyUser, related_name = 'post_starred')
    group = models.ForeignKey(Group, related_name = 'post_group')
    posted_time = models.DateTimeField()

                                  
class UsersLike(models.Model):
    user_id = models.ForeignKey(MyUser)
    post_id = models.ForeignKey(Post)


