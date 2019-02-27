# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='temp',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('first_name', models.CharField(max_length=255)),
                ('last_name', models.CharField(max_length=255)),
                ('temp', models.ForeignKey(to='App_1.admin')),
            ],
        ),
        migrations.CreateModel(
            name='temp_register',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255)),
            ],
        ),
        migrations.RenameField(
            model_name='patient',
            old_name='Patient_id',
            new_name='Patient',
        ),
        migrations.RenameField(
            model_name='user',
            old_name='Password',
            new_name='New_Password',
        ),
        migrations.AlterField(
            model_name='patient',
            name='Blood_type',
            field=models.CharField(max_length=500),
        ),
        migrations.AlterField(
            model_name='patient',
            name='QR_code',
            field=models.CharField(max_length=500),
        ),
        migrations.AlterField(
            model_name='user',
            name='Profile_picture',
            field=models.ImageField(upload_to=''),
        ),
        migrations.AlterField(
            model_name='user',
            name='SSN_Picture',
            field=models.ImageField(upload_to=''),
        ),
    ]
