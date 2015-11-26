# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0004_auto_20151126_2119'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('text', models.TextField()),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL, related_name='post_author')),
                ('group', models.ForeignKey(to='Groups.Group', related_name='post_group')),
                ('starred', models.ManyToManyField(related_name='post_starred', to=settings.AUTH_USER_MODEL)),
                ('user_like', models.ManyToManyField(related_name='post_user_like', to=settings.AUTH_USER_MODEL)),
                ('user_mentioned', models.ManyToManyField(related_name='post_user_mentioned', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=20)),
            ],
        ),
    ]
