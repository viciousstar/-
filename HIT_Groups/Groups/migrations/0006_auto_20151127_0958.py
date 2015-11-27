# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0005_auto_20151127_0919'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='group',
            name='avatar',
        ),
        migrations.RemoveField(
            model_name='group',
            name='avatar_height',
        ),
        migrations.RemoveField(
            model_name='group',
            name='avatar_width',
        ),
    ]
