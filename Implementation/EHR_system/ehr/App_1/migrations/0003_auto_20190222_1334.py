# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0002_auto_20190222_1333'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admin',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
