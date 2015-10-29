# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Groups', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
                ('image', models.ImageField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Reply',
            fields=[
                ('post_ptr', models.OneToOneField(primary_key=True, serialize=False, to='Posts.Post', parent_link=True, auto_created=True)),
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
            name='group',
            field=models.ForeignKey(to='Groups.Group'),
        ),
        migrations.AddField(
            model_name='post',
            name='starred',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='postofstarred'),
        ),
        migrations.AddField(
            model_name='post',
            name='user_like',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='userlike'),
        ),
        migrations.AddField(
            model_name='post',
            name='user_mentioned',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='postofusermentioned'),
        ),
        migrations.AddField(
            model_name='image',
            name='post',
            field=models.ForeignKey(to='Posts.Post'),
        ),
    ]
