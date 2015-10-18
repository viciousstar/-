from django.shortcuts import render
from django.http import HttpResponse
from django.http import Http404

from .models import Group

def GroupsIndex(request):
    groups_index = Group.objects.order_by('update_time')
    context = {'groups_index': groups_index}
    return render(request, 'Groups/GroupIndex.html', context)

def GroupDetail(request,group_id):
    try:
        group = Group.objects.get(pk=group_id)



