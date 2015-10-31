from django.db import models
from django.forms import ModelForm
# from Posts.models import Tag

class Group(models.Model):
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created')
    update_time = models.DateTimeField('date updated')
    #image = models.ImageField()
    description = models.TextField()
    tag = models.CharField(max_length=200)
    permit = models.BooleanField()

    def __str__(self):
        return self.name

class ContactForm(ModelForm):
    class Meta:
        model = Group
        fields = ('name','description','tag','permit')




