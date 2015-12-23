# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0006_merge'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 22, 15, 34, 49, 426656, tzinfo=utc)),
        ),
    ]
