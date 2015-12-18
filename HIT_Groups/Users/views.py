from django.shortcuts import render
from django.contrib.auth import authenticate
from django.contrib.auth import login as django_login
from django.contrib.auth import logout as django_logout
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from Users.models import MyUser
from Users.forms import MyUserForm
from HIT_Groups.settings import LOGIN_REDIRECT_URL, LOGOUT_REDIRECT_URL


def root(request, format=None):
    posts = []
    if request.user.is_authenticated():
        groups = request.user.my_groups.all()
        if "group" in request.GET:
            cur_group = request.user.my_groups.get(id=int(request.GET["group"]))
            posts.extend(cur_group.post_group.all())
            return render(request, "Users/index.html", {"groups": groups, "cur_group": cur_group, "posts": posts})
        else:
            for p in groups:
                posts.extend(p.post_group.all())
            return render(request, "Users/index.html", {"groups": groups, "cur_group": [], "posts": posts})
    return render(request, "Users/index.html", {"groups": [], "cur_group": [], "posts": posts})



def login(request):
    if request.method == "GET":
        if "next" in request.GET:
            return render(request, "Users/login.html", {"next": request.GET['next']})
        return render(request, "Users/login.html")
    else:
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                django_login(request, user)
                if "next" in request.GET:
                    return HttpResponseRedirect(request.GET["next"])
                return HttpResponseRedirect(LOGIN_REDIRECT_URL)
            else:
                return HttpResponse("Invalid Error")
        else:
            return HttpResponse("Password Error")


def logout(request):
    django_logout(request)
    return HttpResponseRedirect(LOGOUT_REDIRECT_URL)

def signup(request):
    if request.method == 'POST':
        form = MyUserForm(request.POST)
        if form.is_valid():
            user = MyUser.objects.create_user(request.POST["username"], request.POST["email"], request.POST["password"])
            return HttpResponseRedirect(LOGIN_REDIRECT_URL)
    else:
        form = MyUserForm()

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
