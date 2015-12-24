from django.shortcuts import render, get_list_or_404
from django.http import HttpResponse, HttpResponseRedirect
from .forms import CommentForm
from .models import Comment
from django.utils import timezone
from .models import Post
from Groups.models import Group
from .forms import PostForm


def post_create(request):
    if request.method == 'POST':
        group = Group.objects.get(pk=request.GET["group"])
        form = PostForm(request.POST)
        if form.is_valid() and group.CanAddPosts(request.user):
            post = Post(
                text=form.cleaned_data["text"],
                author=request.user if request.user.is_active else None,
                group=group,
                posted_time=timezone.now()
                )
            post.save()
            return HttpResponseRedirect("/?group=" + str(group.id))
        return HttpResponse("Sorry, you can not post in this group! If you want to do this, please connent")


def post_delete(request, post_id):
    post = Post.objects.get(pk=post_id)
    if post.creator() == request.user:
        post.delete()
    return HttpResponseRedirect("/?group=" + request.GET["group"])


def post_detail(request, post_id):
    post = Post.objects.get(pk=post_id)
    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = Comment(
                author=request.user,
                post=post,
                text=form.cleaned_data["text"],
                commented_time=timezone.now()
            )
            comment.save()
            return HttpResponseRedirect('/posts/' + str(post.id))
    else:
        form = CommentForm()
    return render(request, 'Posts/post_detail.html', {'form': form, 'post': post, "comments": post.comment_set.all().order_by("-commented_time")})


def post_update(request, post_id):
    post = Post.objects.get(pk=post_id)
    if request.method == 'POST':
        form = PostForm(request.POST)

        if form.is_valid() and (request.user == post.creator()):
            post.text = form.cleaned_data['text']
            post.save()
            return HttpResponseRedirect('/?group=' + str(post.group.id))
    else:
        form = PostForm(instance=post)
    return render(request, 'Posts/post_update.html', {'form': form, 'post_id': post_id})

