from django import template
register = template.Library()

@register.filter(name='is_current_user_profile')
def is_current_user_profile(path, user):
    if path.split("/")[-1] == str(user.id):
        return True
    else:
        return False

# From http://vanderwijk.info/blog/adding-css-classes-formfields-in-django-templates/#comment-1193609278
@register.filter(name='add_attributes')
def add_attributes(field, css):
    attrs = {}
    definition = css.split(',')

    for d in definition:
        if ':' not in d:
            attrs['class'] = d
        else:
            t, v = d.split(':')
            attrs[t] = v

    return field.as_widget(attrs=attrs)