# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admin',
            name='id',
            field=models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True),
        ),
    ]
