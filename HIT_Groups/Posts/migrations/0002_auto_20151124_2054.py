# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Posts', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='post',
        ),
        migrations.RemoveField(
            model_name='reply',
            name='post_ptr',
        ),
        migrations.RemoveField(
            model_name='reply',
            name='reply',
        ),
        migrations.AlterField(
            model_name='post',
            name='author',
            field=models.ForeignKey(related_name='post_author', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='post',
            name='group',
            field=models.ForeignKey(related_name='post_group', to='Groups.Group'),
        ),
        migrations.AlterField(
            model_name='post',
            name='starred',
            field=models.ManyToManyField(related_name='post_starred', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='post',
            name='user_like',
            field=models.ManyToManyField(related_name='post_user_like', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='post',
            name='user_mentioned',
            field=models.ManyToManyField(related_name='post_user_mentioned', to=settings.AUTH_USER_MODEL),
        ),
        migrations.DeleteModel(
            name='Image',
        ),
        migrations.DeleteModel(
            name='Reply',
        ),
    ]
