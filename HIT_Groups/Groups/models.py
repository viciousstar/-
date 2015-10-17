from django.db import models


class Group(models.Model):
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created')
    update_time = models.DateTimeField('date created')
    tag = models.ManyToManyField(Posts.Tag)
    #image = models.ImageField()
    description = models.CharField(max_length=1000)
    tag = models.CharField(max_length=200)
    permit = models.BooleanField()

    def __str__(self):
        return self.name




