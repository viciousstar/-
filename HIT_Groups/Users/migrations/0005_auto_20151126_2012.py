# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0004_auto_20151126_2010'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='avatar_height',
            field=models.IntegerField(default=100),
        ),
        migrations.AddField(
            model_name='myuser',
            name='avatar_width',
            field=models.IntegerField(default=100),
        ),
    ]
