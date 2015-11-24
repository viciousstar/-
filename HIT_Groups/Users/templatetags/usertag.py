from django import template

register = template.Library()


@register.filter(name='is_current_user_profile')
def is_current_user_profile(path, user):
    if path.split("/")[-1] == str(user.id):
        return True
    else:
        return False

