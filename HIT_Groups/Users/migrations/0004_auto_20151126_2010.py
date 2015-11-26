# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0003_auto_20151126_1740'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='myuser',
            name='headimage',
        ),
        migrations.AddField(
            model_name='myuser',
            name='avatar',
            field=models.ImageField(width_field='avatar_width', default=datetime.datetime(2015, 11, 26, 12, 10, 18, 74487, tzinfo=utc), upload_to='avatar/%Y/%m/%d', height_field='avatar_height'),
            preserve_default=False,
        ),
    ]
