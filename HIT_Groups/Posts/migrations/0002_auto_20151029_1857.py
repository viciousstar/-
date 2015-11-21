# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0001_initial'),
        ('Posts', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='tag',
        ),
        migrations.RemoveField(
            model_name='tag',
            name='parent',
        ),
        migrations.AddField(
            model_name='post',
            name='group',
            field=models.ForeignKey(default=datetime.datetime(2015, 10, 29, 10, 57, 41, 8003, tzinfo=utc), to='Groups.Group'),
            preserve_default=False,
        ),
    ]
