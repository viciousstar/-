from django.shortcuts import render
from django.contrib.auth import authenticate
from django.contrib.auth import login as django_login
from django.contrib.auth import logout as django_logout
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseForbidden
from django.core import exceptions
from Users.models import MyUser
from Users.forms import MyUserForm, UserCreationForm
from HIT_Groups.settings import LOGIN_REDIRECT_URL, LOGOUT_REDIRECT_URL, PAGENUM
from util import can_trans, page


def root(request, format=None):
    posts = []
    cur_group = None
    CAN_POST = True
    groups = []
    if request.user.is_authenticated():
        groups = request.user.get_last_groups()
        if "group" in request.GET:
            cur_group = request.user.get_group_by_id(
                can_trans(int, request.GET["group"]))
            posts.extend(cur_group.GetLastPost())
            CAN_POST = cur_group.CanAddPosts(request.user)
        else:
            for p in groups:
                posts.extend(p.GetLastPost())
    return render(request, "Users/index.html", {"groups": groups, "cur_group": cur_group, "posts": page(request, posts), "CAN_POST": CAN_POST})


def logout(request):
    django_logout(request)
    return HttpResponseRedirect(LOGOUT_REDIRECT_URL)


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(LOGIN_REDIRECT_URL)
    else:
        form = UserCreationForm()
    return render(request, 'Users/signup.html', {'form': form})


class UserUpdate(UpdateView):
    model = MyUser
    fields = ['username', 'avatar', "email"]
    success_url = LOGIN_REDIRECT_URL
    template_name = "Users/user_update.html"

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.request.user.can_modify(self.object):
            return super().post(request, *args, **kwargs)
        else:
            return HttpResponseForbidden("Sorry, you do not have the permission.")
