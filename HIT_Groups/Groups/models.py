from django.db import models
from django.forms import ModelForm

from django.views.generic.edit import CreateView, UpdateView, DeleteView

class Group(models.Model):
    choices = (("发布消息","发布消息"),("兴趣爱好","兴趣爱好"),("社团信息","社团信息"),("消息推送","消息推送"))
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created')
    update_time = models.DateTimeField('date updated')
    # avatar = models.ImageField(upload_to='avatar/%Y/%m/%d', height_field="avatar_height", width_field="avatar_width")
    # avatar_height = models.IntegerField(default=100)
    # avatar_width = models.IntegerField(default=100)
    description = models.TextField()
    tag = models.CharField(max_length=10,choices=choices)
    permit = models.BooleanField()
    def __str__(self):
        return self.name

    def CanModifyGroups(self,user):
        if user.has_role_admin(self) or user.has_role_creator(self):
            return True
        else:
            return False

    def CanAddPosts(self,user):
        if user.has_role_user(self) and self.permit == False:
            return False
        else:
            return True

class ContactForm(ModelForm):
    class Meta:
        model = Group
        fields = ('name','description','tag','permit')




