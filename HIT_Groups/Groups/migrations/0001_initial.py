# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('create_time', models.DateTimeField(verbose_name='date created', default=django.utils.timezone.now)),
                ('update_time', models.DateTimeField(verbose_name='date updated', default=django.utils.timezone.now)),
                ('width', models.IntegerField(default=100)),
                ('height', models.IntegerField(default=100)),
                ('image', models.ImageField(height_field='height', width_field='width', upload_to='photos', default='avatar/hit.jpg')),
                ('description', models.TextField()),
                ('tag', models.CharField(max_length=10, choices=[('发布消息', '发布消息'), ('兴趣爱好', '兴趣爱好'), ('社团信息', '社团信息'), ('消息推送', '消息推送')])),
                ('permit', models.BooleanField()),
            ],
        ),
    ]
