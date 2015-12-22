from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, render_to_response
from django.utils import timezone
from .models import Group, ContactForm
from Users.models import UsersAndGroups, MyUser


def GroupsIndex(request):
    group_list = Group.objects.order_by('-update_time')
    context = {'group_list': group_list}
    return render(request, 'Groups/Groupindex.html', context)


def GroupDetail(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    list = group.GetPost()
    return render(request, 'Groups/GroupDetail.html', {'group': group, "list": list})


def GroupModify(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    if group.CanModifyGroups(request.user):
        if request.method == 'POST':
            form = ContactForm(request.POST, request.FILES)
            if form.is_valid():
                image = request.FILES["image"]
                name = form.cleaned_data["name"]
                description = form.cleaned_data["description"]
                tag = form.cleaned_data["tag"]
                permit = form.cleaned_data["permit"]
                group.image = image
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
    else:
        return HttpResponse("Sorry, you do not have the permission.")


def GroupCreate(request):
    if request.method == 'POST':
        form = ContactForm(request.POST, request.FILES)
        if form.is_valid():
            # image = request.FILES["image"]
            # name = form.cleaned_data["name"]
            # description = form.cleaned_data["description"]
            # tag = form.cleaned_data["tag"]
            # permit = form.cleaned_data["permit"]
            group=form.save(commit=False)
            group.create_time = timezone.now()
            group.update_time = timezone.now()
            # group = Group(image=image, name=name, create_time=timezone.now(), update_time=timezone.now(),
            #               description=description, tag=tag, permit=permit)
            group.save()
            uag = UsersAndGroups.objects.create(user_id=request.user, group_id=group, user_role='Creator')
            uag.save()
            return HttpResponseRedirect('/groups/')
    else:
        form = ContactForm()
    return render(request, 'Groups/GroupCreate.html', {'form': form})


def GroupDelete(request, group_id):
    group = Group.objects.get(pk=group_id)
    if group.CanModifyGroups(request.user):
        group.delete()
        return render(request, 'Groups/GroupDelete.html')
    else:
        return HttpResponse("Sorry, you do not have the permission.")


def AddUser(request, group_id):
    group = Group.objects.get(pk=group_id)
    user_list = group.myuser_set.all()
    if request.user not in user_list:
        uag = UsersAndGroups.objects.create(user_id=request.user, group_id=group, user_role='User')
        uag.save()
        return HttpResponseRedirect('/')
    else:
        return HttpResponse("already in this group")
