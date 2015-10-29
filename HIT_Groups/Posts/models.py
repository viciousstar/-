from django.db import models
from Users.models import MyUser
from Groups.models import Group


class Tag(models.Model):
    name = models.CharField(max_length = 20)
    # parent = models.ForeignKey('self')


class Post(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'postofauthor')
    user_like = models.ManyToManyField(MyUser, related_name = 'userlike')
    # tag = models.ManyToManyField(Tag, related_name = 'postoftag')
    user_mentioned = models.ManyToManyField(MyUser, related_name = 'postofusermentioned')
    starred = models.ManyToManyField(MyUser, related_name = 'postofstarred')
    group = models.ForeignKey(Group)

class Image(models.Model):
    name = models.CharField(max_length = 20)
    image = models.ImageField()
    post = models.ForeignKey(Post)


class Reply(Post):
    reply = models.ForeignKey('self', related_name = 'replyofreply')

