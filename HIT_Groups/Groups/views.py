from django.shortcuts import render
from django.http import HttpResponse

def group_index(request):
    return HttpResponse("You're at the Group index.")
