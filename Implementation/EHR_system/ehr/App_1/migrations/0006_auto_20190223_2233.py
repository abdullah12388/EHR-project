# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0005_auto_20190223_2211'),
    ]

    operations = [
        migrations.RenameField(
            model_name='temp',
            old_name='temp_id',
            new_name='temp',
        ),
    ]
