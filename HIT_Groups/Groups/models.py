from django.db import models
from django.forms import ModelForm
# from Posts.models import Tag

class Group(models.Model):
    choices = (("发布消息","发布消息"),("兴趣爱好","兴趣爱好"),("社团信息","社团信息"),("消息推送","消息推送"))
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created')
    update_time = models.DateTimeField('date updated')
    #image = models.ImageField()
    description = models.TextField()
    tag = models.CharField(max_length=10,choices=choices)
    permit = models.BooleanField()

    def __str__(self):
        return self.name

class ContactForm(ModelForm):
    class Meta:
        model = Group
        fields = ('name','description','tag','permit')




