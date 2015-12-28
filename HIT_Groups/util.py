# use for get data from request
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from HIT_Groups.settings import PAGENUM
def can_trans(tp, value):
    try:
        return tp(value)
    except:
        raise exceptions.SuspiciousOperation

def page(request, obj):
    paginator = Paginator(obj, PAGENUM)
    page = request.GET.get('page')
    try:
        page_obj = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        page_obj = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        page_obj = paginator.page(paginator.num_pages)
    return page_obj