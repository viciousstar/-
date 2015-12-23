# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0008_auto_20151222_2334'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='height',
            field=models.IntegerField(default=100),
        ),
        migrations.AlterField(
            model_name='group',
            name='width',
            field=models.IntegerField(default=100),
        ),
    ]
