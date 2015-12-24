# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0012_auto_20151224_1217'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='commented_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 24, 7, 10, 48, 945896, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='post',
            name='posted_time',
            field=models.DateTimeField(default=datetime.datetime(2015, 12, 24, 7, 10, 48, 945220, tzinfo=utc)),
        ),
    ]
