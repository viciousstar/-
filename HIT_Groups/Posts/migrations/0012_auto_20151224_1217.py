# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Posts', '0011_auto_20151223_1559'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('text', models.TextField()),
                ('commented_time', models.DateTimeField(default=datetime.datetime(2015, 12, 24, 4, 17, 20, 261030, tzinfo=utc))),
                ('author', models.ForeignKey(related_name='comment_author', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.DeleteModel(
            name='Tag',
        ),
        migrations.RemoveField(
            model_name='userslike',
            name='post',
        ),
        migrations.RemoveField(
            model_name='userslike',
            name='user',
        ),
        migrations.RemoveField(
            model_name='post',
            name='starred',
        ),
        migrations.RemoveField(
            model_name='post',
            name='users_like',
        ),
        migrations.RemoveField(
            model_name='post',
            name='users_mentioned',
        ),
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 24, 4, 17, 20, 261030, tzinfo=utc)),
        ),
        migrations.DeleteModel(
            name='UsersLike',
        ),
        migrations.AddField(
            model_name='comment',
            name='post',
            field=models.ForeignKey(to='Posts.Post'),
        ),
    ]
