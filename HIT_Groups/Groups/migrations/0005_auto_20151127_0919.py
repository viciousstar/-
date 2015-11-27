# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0004_auto_20151126_2119'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='avatar',
            field=models.ImageField(height_field='avatar_height', upload_to='avatar/groups/%Y', width_field='avatar_width', default=datetime.datetime(2015, 11, 27, 1, 19, 9, 8798, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='group',
            name='avatar_height',
            field=models.IntegerField(default=100),
        ),
        migrations.AddField(
            model_name='group',
            name='avatar_width',
            field=models.IntegerField(default=100),
        ),
    ]
