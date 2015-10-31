from django.db import models
from Users.models import MyUser
from Groups.models import Group


class Tag(models.Model):
    name = models.CharField(max_length = 20)
    # parent = models.ForeignKey('self')


class Post(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'post.author')
    user_like = models.ManyToManyField(MyUser, related_name = 'post.user_like')
    # tag = models.ManyToManyField(Tag, related_name = 'postoftag')
    user_mentioned = models.ManyToManyField(MyUser, related_name = 'post.user_mentioned')
    starred = models.ManyToManyField(MyUser, related_name = 'post.starred')
    group = models.ForeignKey(Group, related_name = 'post.group')


class Image(models.Model):
    name = models.CharField(max_length = 20)
    image = models.ImageField()
    post = models.ForeignKey(Post)



class Reply(Post):
    reply = models.ForeignKey('self', related_name = 'reply.reply')




