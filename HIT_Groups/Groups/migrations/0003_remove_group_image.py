# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0002_group_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='group',
            name='image',
        ),
    ]
