# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0005_auto_20151126_2012'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='avatar',
            field=models.ImageField(width_field='avatar_width', height_field='avatar_height', upload_to='avatar/%Y/%m/%d', default='avatar/hit.jpg'),
        ),
    ]
