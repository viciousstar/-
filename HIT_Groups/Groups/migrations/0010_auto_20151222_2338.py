# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0009_auto_20151222_2336'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='image',
            field=models.ImageField(null=True, blank=True, width_field='width', upload_to='photos', height_field='height'),
        ),
    ]
