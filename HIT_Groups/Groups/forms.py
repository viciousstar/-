from django.forms import ModelForm

from .models import Group

class ContactForm(ModelForm):
    class Meta:
        model = Group
        fields = ('image', 'name', 'description', 'tag', 'permit')