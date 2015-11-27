# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0003_auto_20151127_0954'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 11, 27, 3, 38, 22, 397952, tzinfo=utc)),
        ),
    ]
