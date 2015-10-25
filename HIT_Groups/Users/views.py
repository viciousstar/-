from django.shortcuts import render
from django.contrib.auth import authenticate
from django.contrib.auth import login as django_login
from django.contrib.auth import logout as django_logout

from django.http import HttpResponseRedirect, HttpResponse
from Users.models import MyUser
from rest_framework import (generics,
                            permissions,
                            )
# from rest_framework import
from rest_framework.renderers import (TemplateHTMLRenderer,
                                      BrowsableAPIRenderer)
from rest_framework.decorators import api_view
from Users.serializers import UserSerializer
# Create your views here.


class UserList(generics.ListCreateAPIView):

    """docstring for UserList"""
    queryset = MyUser.objects.all()
    serializer_class = UserSerializer
    # renderer_classes = (TemplateHTMLRenderer, )
    # template_name = "Users/base.html"

    # def list(self, request):
    # return render(request, self.template_name, {"objects": queryset})
    # def list(self, request):
    # Note the use of `get_queryset()` instead of `self.queryset`
    #     queryset = self.get_queryset()
    #     serializer = UserSerializer(queryset, many=True)
    # return render(request, self.template_name, {"objects": serializer.data})

    # return Response(serializer.data)


class UserDetail(generics.RetrieveUpdateAPIView):

    """docstring for UserList"""
    queryset = MyUser.objects.all()
    serializer_class = UserSerializer


@api_view(('GET',))
def root(request, format=None):
    return render(request, "Users/index.html")


@api_view(("GET", "POST"))
def login(request):
    if request.method == "GET":
        return render(request, "Users/login.html")
    else:
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                django_login(request, user)
                return HttpResponseRedirect("/")
            else:
                return HttpResponse("Invalid Error")
        else:
            return HttpResponse("Password Error")


@api_view(("GET", ))
def logout(request):
    django_logout(request)
    return HttpResponseRedirect("/")
