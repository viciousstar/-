from django.db import models
from Users.models import MyUser
from Groups.models import Group
from django.utils import timezone




class Post(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'post_author')
    group = models.ForeignKey(Group, related_name = 'post_group')
    posted_time = models.DateTimeField(default=timezone.now())

    def creator(self):
        return self.author


class Comment(models.Model):
    text = models.TextField()
    author = models.ForeignKey(MyUser, related_name = 'comment_author')
    commented_time = models.DateTimeField(default=timezone.now())
    post = models.ForeignKey(Post)

    def creator(self):
        return self.author


