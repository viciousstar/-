# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=20)),
                ('image', models.ImageField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=20)),
                ('parent', models.ForeignKey(to='Posts.Tag')),
            ],
        ),
        migrations.CreateModel(
            name='Reply',
            fields=[
                ('post_ptr', models.OneToOneField(serialize=False, auto_created=True, to='Posts.Post', parent_link=True, primary_key=True)),
                ('reply', models.ForeignKey(to='Posts.Reply', related_name='replyofreply')),
            ],
            bases=('Posts.post',),
        ),
        migrations.AddField(
            model_name='post',
            name='author',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, related_name='postofauthor'),
        ),
        migrations.AddField(
            model_name='post',
            name='starred',
            field=models.ManyToManyField(related_name='postofstarred', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='post',
            name='tag',
            field=models.ManyToManyField(related_name='postoftag', to='Posts.Tag'),
        ),
        migrations.AddField(
            model_name='post',
            name='user_like',
            field=models.ManyToManyField(related_name='userlike', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='post',
            name='user_mentioned',
            field=models.ManyToManyField(related_name='postofusermentioned', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='image',
            name='post',
            field=models.ForeignKey(to='Posts.Post'),
        ),
    ]
