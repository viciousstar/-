from django.db import models
from Posts.models import Tag


class Group(models.Model):
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created')
    update_time = models.DateTimeField('date updated')
    tag = models.ManyToManyField(Tag)
    #image = models.ImageField()
    description = models.TextField()
    tag = models.CharField(max_length=200)
    permit = models.BooleanField()

    def __str__(self):
        return self.name




