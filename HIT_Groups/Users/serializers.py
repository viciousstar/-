from rest_framework import serializers
from Users.models import MyUser


class UserSerializer(serializers.ModelSerializer):

    """docstring for SnippetSerializer"""
    class Meta:
        model = MyUser
        field = ('id', 'username', "email")
