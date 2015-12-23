# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0010_auto_20151222_2338'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='image',
            field=models.ImageField(height_field='height', width_field='width', upload_to='photos/%Y/%m/%d', default=datetime.datetime(2015, 12, 22, 15, 42, 48, 981519, tzinfo=utc)),
            preserve_default=False,
        ),
    ]
