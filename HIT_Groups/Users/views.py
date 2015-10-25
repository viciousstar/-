from django.shortcuts import render
from Users.models import MyUser
from rest_framework import (generics,
                            permissions,
                            )
# from rest_framework import
from rest_framework.renderers import TemplateHTMLRenderer, BrowsableAPIRenderer
from Users.serializers import UserSerializer
# Create your views here.


class UserList(generics.ListCreateAPIView):

    """docstring for UserList"""
    queryset = MyUser.objects.all()
    serializer_class = UserSerializer
    # renderer_classes = (TemplateHTMLRenderer, )
    # template_name = "Users/base.html"

    # # def list(self, request):
    #     # return render(request, self.template_name, {"objects": queryset})
    # def list(self, request):
    #     # Note the use of `get_queryset()` instead of `self.queryset`
    #     queryset = self.get_queryset()
    #     serializer = UserSerializer(queryset, many=True)
    #     return render(request, self.template_name, {"objects": serializer.data})

    #     # return Response(serializer.data)


class UserDetail(generics.RetrieveUpdateAPIView):

    """docstring for UserList"""
    queryset = MyUser.objects.all()
    serializer_class = UserSerializer

