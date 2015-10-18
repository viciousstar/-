from django.db import models
from HIT_Groups.Users.models import User


# Create your models here.

class Post(models.Model):
    text = models.TextField()
    image = models.ForeignKey(Image)
    author = models.ForeignKey(models.User)
    user_like = models.ManyToManyField(models.User)
    tag = models.ManyToManyField(Tag)
    user_mentioned = models.ManyToManyField(models.User)
    starred = models.ManyToManyField(models.User)


class Image(models.Model):
    name = models.CharField()
    image = models.ImageField()
    post = models.ForeignKey(Post)


class Reply(Post):
    reply = models.ForeignKey('self')


class Tag(models.Model):
    name = models.CharField()
    parent = models.ForeignKey('self')
