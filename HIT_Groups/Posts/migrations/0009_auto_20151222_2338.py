# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0008_auto_20151222_2336'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 22, 15, 38, 4, 802877, tzinfo=utc)),
        ),
    ]
