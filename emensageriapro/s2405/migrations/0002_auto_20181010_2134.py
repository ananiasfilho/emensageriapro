# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-10-10 21:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('s2405', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='s2405dependente',
            name='incfismen',
            field=models.CharField(choices=[(b'N', 'N - N\xe3o'), (b'S', 'S - Sim')], max_length=1),
        ),
    ]