# -*- coding: utf-8 -*-
from __future__ import unicode_literals

<<<<<<< HEAD
from django.db import migrations, models
=======
from django.db import models, migrations
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
<<<<<<< HEAD
=======
        ('Groups', '0001_initial'),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
<<<<<<< HEAD
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
=======
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
                ('name', models.CharField(max_length=20)),
                ('image', models.ImageField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
<<<<<<< HEAD
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
=======
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
<<<<<<< HEAD
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=20)),
                ('parent', models.ForeignKey(to='Posts.Tag')),
=======
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
            ],
        ),
        migrations.CreateModel(
            name='Reply',
            fields=[
<<<<<<< HEAD
                ('post_ptr', models.OneToOneField(serialize=False, auto_created=True, to='Posts.Post', parent_link=True, primary_key=True)),
=======
                ('post_ptr', models.OneToOneField(primary_key=True, serialize=False, to='Posts.Post', parent_link=True, auto_created=True)),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
                ('reply', models.ForeignKey(to='Posts.Reply', related_name='replyofreply')),
            ],
            bases=('Posts.post',),
        ),
        migrations.AddField(
            model_name='post',
            name='author',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, related_name='postofauthor'),
        ),
        migrations.AddField(
            model_name='post',
<<<<<<< HEAD
            name='starred',
            field=models.ManyToManyField(related_name='postofstarred', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='post',
            name='tag',
            field=models.ManyToManyField(related_name='postoftag', to='Posts.Tag'),
=======
            name='group',
            field=models.ForeignKey(to='Groups.Group'),
        ),
        migrations.AddField(
            model_name='post',
            name='starred',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='postofstarred'),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
        ),
        migrations.AddField(
            model_name='post',
            name='user_like',
<<<<<<< HEAD
            field=models.ManyToManyField(related_name='userlike', to=settings.AUTH_USER_MODEL),
=======
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='userlike'),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
        ),
        migrations.AddField(
            model_name='post',
            name='user_mentioned',
<<<<<<< HEAD
            field=models.ManyToManyField(related_name='postofusermentioned', to=settings.AUTH_USER_MODEL),
=======
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, related_name='postofusermentioned'),
>>>>>>> c162e66d5b5b5c08f9ba61fcba1844113475a147
        ),
        migrations.AddField(
            model_name='image',
            name='post',
            field=models.ForeignKey(to='Posts.Post'),
        ),
    ]
