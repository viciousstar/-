from django.shortcuts import render, get_list_or_404
from django.http import HttpResponse, HttpResponseRedirect

from .models import Post
from Groups.models import Group
from .forms import PostForm


# Create your views here.
def post_index(request, group_id):
    print(group_id)
    post_list = get_list_or_404(Post, group=group_id)
    return render(request, 'Posts/post_index.html', {'post_list': post_list, 'group_id': group_id})


def post_create(request, group_id):
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_valid():
            post = Post(
                text=form.cleaned_data["text"],
                author=request.user if request.user.is_active else None,
                group=Group.objects.get(pk=group_id)
                )
            post.save()
            return HttpResponseRedirect('/groups/' + group_id + '/posts/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_create.html', {'form': form, 'group_id': group_id})


def post_delete(request, group_id, post_id):
    post = Post.objects.get(pk=post_id)
    post.delete()
    return render(request, 'Posts/post_delete.html',{'group_id':group_id})


def post_reply(request, group_id, post_id):
    pass


def post_update(request, group_id, post_id):
    post = Post.objects.get(pk=post_id)
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_valid():
            post.text = form.cleaned_data['text']
            post.save()
            return HttpResponseRedirect('/groups/' + group_id + '/posts/')
    else:
        form = PostForm()
    return render(request, 'Posts/post_update.html', {'form': form, 'group_id':group_id,'post_id': post_id})


