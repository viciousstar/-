# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.conf import settings
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Posts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UsersLike',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='post',
            name='user_like',
        ),
        migrations.RemoveField(
            model_name='post',
            name='user_mentioned',
        ),
        migrations.AddField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 11, 27, 0, 37, 3, 570520, tzinfo=utc)),
        ),
        migrations.AddField(
            model_name='post',
            name='users_mentioned',
            field=models.ManyToManyField(related_name='post_users_mentioned', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='userslike',
            name='post',
            field=models.ForeignKey(to='Posts.Post'),
        ),
        migrations.AddField(
            model_name='userslike',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='post',
            name='users_like',
            field=models.ManyToManyField(through='Posts.UsersLike', related_name='post_users_like', to=settings.AUTH_USER_MODEL),
        ),
    ]
