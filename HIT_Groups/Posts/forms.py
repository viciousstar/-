from .models import Post, Comment
from django import forms
from pagedown.widgets import PagedownWidget

class PostForm(forms.ModelForm):
    text = forms.CharField(widget=PagedownWidget())
    class Meta:
        model = Post
        fields = ("text", )

class CommentForm(forms.ModelForm):
    text = forms.CharField(widget=PagedownWidget())
    class Meta:
        model = Comment
        fields = ("text", )