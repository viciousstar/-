from .models import Post
from django import forms
from pagedown.widgets import PagedownWidget

class PostForm(forms.ModelForm):
    text = forms.CharField(widget=PagedownWidget())
    class Meta:
        model = Post
        fields = ("text", )