from django.db import models
from django.utils import timezone

class Group(models.Model):
    choices = (("发布消息", "发布消息"), ("兴趣爱好", "兴趣爱好"), ("社团信息", "社团信息"), ("消息推送", "消息推送"))
    name = models.CharField(max_length=200)
    create_time = models.DateTimeField('date created', default=timezone.now)
    update_time = models.DateTimeField('date updated', default=timezone.now)
    width = models.IntegerField(default=100)
    height = models.IntegerField(default=100)
    image = models.ImageField(upload_to='photos', height_field="height", width_field="width", default="avatar/hit.jpg")
    description = models.TextField()
    tag = models.CharField(max_length=10, choices=choices)
    permit = models.BooleanField()

    def __str__(self):
        return self.name

    def CanModifyGroups(self, user):
        if user.has_role_admin(self) or user.has_role_creator(self):
            return True
        else:
            return False

    def CanAddPosts(self, user):
        if user.has_role_user(self) and self.permit == False:
            return False
        else:
            return True

    def UserInGroup(self, user):
        user_list = self.myuser_set.all()
        if user in user_list:
            return True
        else:
            return False

    def GetPost(group):
        post_list = group.post_group.all()
        return post_list

    def GetLastPost(group):
        post_list = group.post_group.all().order_by("-posted_time")
        return post_list


