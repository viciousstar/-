# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0011_auto_20151222_2342'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='image',
            field=models.ImageField(upload_to='photos', null=True, height_field='height', width_field='width', blank=True),
        ),
    ]
