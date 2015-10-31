from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

from .models import Post
from .forms import PostForm


# Create your views here.
def post_index(request):
    post_list = Post.objects.order_by('-update_time')
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
            return HttpResponseRedirect('/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_create', {'form', form})


def post_delete(request, post_id):
    if request == 'POST':
        post = Post.objects.get(pk=post_id)
        post.delete()
        return render(request, 'Posts/post_delete')


def post_read(request, post_id):
    if request.method == 'GET':
        post = Post.objects.get(pk=post_id)
        return render(request, 'Posts/post_read', {'post': post})


def post_update(request, post_id):
    post = Post.objects.get(pk=post_id)
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_vaild():
            post.text = request['text']
            return HttpResponseRedirect('/posts/' + post_id + '/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_create', {'form': form, 'post': post})


