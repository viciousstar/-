# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='author',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, related_name='post_author'),
        ),
        migrations.AlterField(
            model_name='post',
            name='group',
            field=models.ForeignKey(to='Groups.Group', related_name='post_group'),
        ),
        migrations.AlterField(
            model_name='post',
            name='starred',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='post_starred'),
        ),
        migrations.AlterField(
            model_name='post',
            name='user_like',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='post_user_like'),
        ),
        migrations.AlterField(
            model_name='post',
            name='user_mentioned',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='post_user_mentioned'),
        ),
        migrations.AlterField(
            model_name='reply',
            name='reply',
            field=models.ForeignKey(to='Posts.Reply', related_name='reply_reply'),
        ),
    ]
