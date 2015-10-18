# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('create_time', models.DateTimeField(verbose_name='date created')),
                ('update_time', models.DateTimeField(verbose_name='date updated')),
                ('description', models.TextField()),
                ('tag', models.CharField(max_length=200)),
                ('permit', models.BooleanField()),
            ],
        ),
    ]
