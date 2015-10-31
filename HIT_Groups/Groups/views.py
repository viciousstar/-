from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, render_to_response

from django.utils import timezone

from .models import Group, ContactForm


def GroupsIndex(request):
    group_list = Group.objects.order_by('-update_time')
    context = {'group_list': group_list}
    return render(request, 'Groups/Groupindex.html', context)


def GroupDetail(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    return render(request, 'Groups/GroupDetail.html', {'group': group})


def GroupModify(request, group_id):
    group = get_object_or_404(Group, pk=group_id)
    if request.method == 'POST':
        form = ContactForm(request.POST)  # 获取Post表单数据
        if form.is_valid():  # 验证表单
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
        form = ContactForm()  # 第一次生成的form里面内容的格式
    return render(request, 'Groups/GroupModify.html', {'form': form, 'group': group})


def GroupCreate(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)  # 获取Post表单数据
        if form.is_valid():  # 验证表单
            name = form.cleaned_data["name"]
            description = form.cleaned_data["description"]
            tag = form.cleaned_data["tag"]
            permit = form.cleaned_data["permit"]
            grouptest = Group.objects.get(pk=1)
            group = Group(name=name, create_time=timezone.now(), update_time=timezone.now(), image=grouptest.image,
                          description=description, tag=tag, permit=permit)
            group.save()
            uag = UsersAndGroups.objects.create(user_id = request.user,group_id = group,user_role = 'Creator')
            uag.save()
            return HttpResponseRedirect('/groups/')
    else:
        form = ContactForm()  # 第一次生成的form里面内容的格式
    return render(request, 'Groups/GroupCreate.html', {'form': form})


def GroupDelete(request, group_id):
    group = Group.objects.get(pk=group_id)

    group.delete()
    return render(request, 'Groups/GroupDelete.html')
