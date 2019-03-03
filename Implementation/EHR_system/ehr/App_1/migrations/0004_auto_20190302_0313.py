# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0003_auto_20190302_0303'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='clinic_id',
            field=models.ForeignKey(blank=True, null=True, to='App_1.organization'),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='hospital_id',
            field=models.ForeignKey(blank=True, null=True, to='App_1.hospital'),
        ),
    ]
