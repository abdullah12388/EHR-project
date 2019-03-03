# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0002_auto_20190227_0017'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='End_date',
            field=models.DateField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='Last_date_payment',
            field=models.DateField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='Working_till',
            field=models.TimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='Date_of_birth',
            field=models.DateField(),
        ),
    ]
