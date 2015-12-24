from django.shortcuts import render
from django.contrib.auth import authenticate
from django.contrib.auth import login as django_login
from django.contrib.auth import logout as django_logout
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from Users.models import MyUser
from Users.forms import MyUserForm, UserCreationForm
from HIT_Groups.settings import LOGIN_REDIRECT_URL, LOGOUT_REDIRECT_URL


def root(request, format=None):
    posts = []
    cur_group = None
    CAN_POST = True
    groups = []
    if request.user.is_authenticated():
        groups = request.user.get_last_groups()
        if "group" in request.GET:
            cur_group = request.user.get_group_by_id(int(request.GET["group"]))
            posts.extend(cur_group.GetLastPost())
            CAN_POST = cur_group.CanAddPosts(request.user)
        else:
            for p in groups:
                posts.extend(p.GetLastPost())
        paginator = Paginator(posts, 20)
        page = request.GET.get('page')
        try:
            page_posts = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            page_posts = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            page_posts = paginator.page(paginator.num_pages)
    return render(request, "Users/index.html", {"groups": groups, "cur_group": cur_group, "posts": page_posts, "CAN_POST": CAN_POST})

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

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.request.user.can_modify(self.object):
            return super().post(request, *args, **kwargs)
        else:
            return HttpResponse("Sorry, you do not have the permission.")
