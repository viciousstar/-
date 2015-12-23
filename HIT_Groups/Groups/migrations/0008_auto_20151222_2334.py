# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0007_group_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='height',
            field=models.IntegerField(default=500),
        ),
        migrations.AddField(
            model_name='group',
            name='width',
            field=models.IntegerField(default=1000),
        ),
        migrations.AlterField(
            model_name='group',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='photos'),
        ),
    ]
