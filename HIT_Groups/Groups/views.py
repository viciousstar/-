from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, render_to_response

from django.utils import timezone

from .models import Group, ContactForm

from Users.models import UsersAndGroups


def GroupsIndex(request):
    group_list = Group.objects.order_by('-update_time')
    context = {'group_list': group_list}
    return render(request, 'Groups/Groupindex.html', context)


def GroupDetail(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    list=GetPost(group)
    return render(request, 'Groups/GroupDetail.html', {'group': group,"list":list})


def GroupModify(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    if request.method == 'POST':
        form = ContactForm(request.POST) 
        if form.is_valid():
            name = form.cleaned_data["name"]
            description = form.cleaned_data["description"]
            tag = form.cleaned_data["tag"]
            permit = form.cleaned_data["permit"]
            group.name = name
            group.description = description
            group.tag = tag
            group.permit = permit
            group.update_time = timezone.now()
            group.save()
            return HttpResponseRedirect('/groups/' + group_id + '/')
    else:
        form = ContactForm()
    return render(request, 'Groups/GroupModify.html', {'form': form, 'group': group})


def GroupCreate(request):
    if request.method == 'POST':
        form = ContactForm(request.POST) 
        if form.is_valid(): 
            name = form.cleaned_data["name"]
            description = form.cleaned_data["description"]
            tag = form.cleaned_data["tag"]
            permit = form.cleaned_data["permit"]
            group = Group(name=name, create_time=timezone.now(), update_time=timezone.now(),
                          description=description, tag=tag, permit=permit)
            group.save()
            uag = UsersAndGroups.objects.create(user_id = request.user,group_id = group,user_role = 'Creator')
            uag.save()
            return HttpResponseRedirect('/groups/')
    else:
        form = ContactForm()
    return render(request, 'Groups/GroupCreate.html', {'form': form})


def GroupDelete(request, group_id):
    group = Group.objects.get(pk=group_id)

    group.delete()
    return render(request, 'Groups/GroupDelete.html')

def AddUser(request,group_id):
    group = Group.objects.get(pk=group_id)
    uag = UsersAndGroups.objects.create(user_id = request.user,group_id = group,user_role = 'User')
    uag.save()
    return HttpResponseRedirect('/')

def GetPost(group):
    post_list = group.post_group.all()
    return post_list
