# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0007_auto_20151222_2334'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 22, 15, 36, 29, 520955, tzinfo=utc)),
        ),
    ]
