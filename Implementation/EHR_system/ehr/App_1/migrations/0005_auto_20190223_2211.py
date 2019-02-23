# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0004_temp'),
    ]

    operations = [
        migrations.AddField(
            model_name='temp',
            name='temp_id',
            field=models.ForeignKey(default=1, to='App_1.admin'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='temp',
            name='id',
            field=models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True),
        ),
    ]
