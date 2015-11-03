from django.shortcuts import render, get_list_or_404
from django.http import HttpResponse, HttpResponseRedirect

from .models import Post
from .forms import PostForm


# Create your views here.
def post_index(request, group_id):
    post_list = get_list_or_404(Post, group=group_id)
    return render(request, 'Post/post_index', {'post_list': post_list})


def post_create(request, group_id):
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_vaild():
            post = Post(
                text=request["text"],
                author=request.user if request.user.is_active else None,
                user_like=[],
                user_mentioned=[],
                starred=False,
                group=group_id
                )
            post.save()
            return HttpResponseRedirect('/posts/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_create', {'form', form})


def post_delete(request, post_id):
    post = Post.objects.get(pk=post_id)
    post.delete()
    return render(request, 'Posts/post_delete')


def post_read(request, post_id):
    post = Post.objects.get(pk=post_id)
    return render(request, 'Posts/post_read', {'post': post})


def post_update(request, post_id):
    post = Post.objects.get(pk=post_id)
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_vaild():
            post.text = request['text']
            return HttpResponseRedirect('/posts/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_create', {'form': form, 'post': post})


