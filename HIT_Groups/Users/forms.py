from .models import MyUser
from django.forms import ModelForm

class MyUserForm(ModelForm):
    """docstring for MyUserForm"""
    class Meta:
        model = MyUser
        fields = ["username", "email", "password"]

