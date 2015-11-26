# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Groups', '0003_remove_group_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='tag',
            field=models.CharField(max_length=10, choices=[('发布消息', '发布消息'), ('兴趣爱好', '兴趣爱好'), ('社团信息', '社团信息'), ('消息推送', '消息推送')]),
        ),
    ]
