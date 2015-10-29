# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Groups', '0002_group_image'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
                ('image', models.ImageField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Reply',
            fields=[
                ('post_ptr', models.OneToOneField(auto_created=True, primary_key=True, serialize=False, parent_link=True, to='Posts.Post')),
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
            field=models.ManyToManyField(related_name='postofstarred', to=settings.AUTH_USER_MODEL),
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
