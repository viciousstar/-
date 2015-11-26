# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0002_myuser_headimage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='headimage',
            field=models.ImageField(upload_to='headimage/%Y/%m/%d'),
        ),
    ]
