# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0006_auto_20190223_2028'),
    ]

    operations = [
        migrations.RenameField(
            model_name='patient',
            old_name='Patient_id',
            new_name='Patient',
        ),
    ]
