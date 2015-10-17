from django.db import models


# Create your models here.

class Post(models.Model):
    text = models.TextField()
    image = models.ForeignKey(Image)
    author = models.ForeignKey(Users.User)
    liker = models.ManyToManyField(Users.User)
    tag = models.ManyToManyField(Tag)
    mentioned_user = models.ManyToManyField(Users.User)
    starred = models.ManyToManyField(Users.User)


class Image(models.Model):
    name = models.CharField()
    image = models.ImageField()


class Reply(Post):
    reply = models.ForeignKey('self')


class Tag(models.Model):
    name = models.CharField()
    parent = models.ForeignKey('self')
