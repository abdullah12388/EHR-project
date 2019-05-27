# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-03-09 14:51
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('App_1', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='comments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField()),
                ('role', models.IntegerField()),
                ('comment_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='temp',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=255)),
                ('last_name', models.CharField(max_length=255)),
                ('temp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='App_1.admin')),
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
            model_name='blocked_hospitals',
            old_name='hospital_id',
            new_name='hospital',
        ),
        migrations.RenameField(
            model_name='blocked_hospitals',
            old_name='manager_id',
            new_name='manager',
        ),
        migrations.RenameField(
            model_name='blocked_organizations',
            old_name='manager_id',
            new_name='manager',
        ),
        migrations.RenameField(
            model_name='blocked_organizations',
            old_name='organ_id',
            new_name='organ',
        ),
        migrations.RenameField(
            model_name='blocked_users',
            old_name='manager_id',
            new_name='manager',
        ),
        migrations.RenameField(
            model_name='blocked_users',
            old_name='user_id',
            new_name='user',
        ),
        migrations.RenameField(
            model_name='doctor',
            old_name='Doc_id',
            new_name='Doc',
        ),
        migrations.RenameField(
            model_name='multi_analytics',
            old_name='P_A_id',
            new_name='P_A',
        ),
        migrations.RenameField(
            model_name='multi_analytics',
            old_name='report_id',
            new_name='report',
        ),
        migrations.RenameField(
            model_name='multi_chronic',
            old_name='P_C_id',
            new_name='P_C',
        ),
        migrations.RenameField(
            model_name='multi_chronic',
            old_name='report_id',
            new_name='report',
        ),
        migrations.RenameField(
            model_name='multi_medecines',
            old_name='P_M_id',
            new_name='P_M',
        ),
        migrations.RenameField(
            model_name='multi_medecines',
            old_name='report_id',
            new_name='report',
        ),
        migrations.RenameField(
            model_name='multi_rays',
            old_name='P_R_id',
            new_name='P_R',
        ),
        migrations.RenameField(
            model_name='multi_rays',
            old_name='report_id',
            new_name='report',
        ),
        migrations.RenameField(
            model_name='patient',
            old_name='Patient_id',
            new_name='Patient',
        ),
        migrations.RenameField(
            model_name='patient_analytics',
            old_name='analy_id',
            new_name='analy',
        ),
        migrations.RenameField(
            model_name='patient_analytics',
            old_name='lab_id',
            new_name='lab',
        ),
        migrations.RenameField(
            model_name='patient_analytics',
            old_name='pat_id',
            new_name='pat',
        ),
        migrations.RenameField(
            model_name='patient_chronic',
            old_name='chr_id',
            new_name='chr',
        ),
        migrations.RenameField(
            model_name='patient_chronic',
            old_name='pat_id',
            new_name='pat',
        ),
        migrations.RenameField(
            model_name='patient_medicine',
            old_name='med_id',
            new_name='med',
        ),
        migrations.RenameField(
            model_name='patient_medicine',
            old_name='pat_id',
            new_name='pat',
        ),
        migrations.RenameField(
            model_name='patient_medicine',
            old_name='pharmacy_id',
            new_name='pharmacy',
        ),
        migrations.RenameField(
            model_name='patient_rays',
            old_name='lab_id',
            new_name='lab',
        ),
        migrations.RenameField(
            model_name='patient_rays',
            old_name='pat_id',
            new_name='pat',
        ),
        migrations.RenameField(
            model_name='patient_rays',
            old_name='ray_id',
            new_name='ray',
        ),
        migrations.RenameField(
            model_name='report',
            old_name='doctor_id',
            new_name='doctor',
        ),
        migrations.RenameField(
            model_name='report',
            old_name='patient_id',
            new_name='patient',
        ),
        migrations.RenameField(
            model_name='report',
            old_name='prescription_id',
            new_name='prescription',
        ),
        migrations.RenameField(
            model_name='report',
            old_name='report_id',
            new_name='report',
        ),
        migrations.RenameField(
            model_name='user',
            old_name='Password',
            new_name='New_Password',
        ),
        migrations.RemoveField(
            model_name='doctor',
            name='clinic_id',
        ),
        migrations.RemoveField(
            model_name='doctor',
            name='hospital_id',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='hospital_id',
        ),
        migrations.RemoveField(
            model_name='prescription',
            name='Submit_date',
        ),
        migrations.AddField(
            model_name='doctor',
            name='clinic',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.organization'),
        ),
        migrations.AddField(
            model_name='doctor',
            name='hospital',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.hospital'),
        ),
        migrations.AddField(
            model_name='organization',
            name='hospital',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.hospital'),
        ),
        migrations.AddField(
            model_name='report',
            name='Submit_date',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='report',
            name='clinic',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.organization'),
        ),
        migrations.AddField(
            model_name='report',
            name='hospital',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.hospital'),
        ),
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
            model_name='hospital',
            name='creation_date',
            field=models.DateField(),
        ),
        migrations.AlterField(
            model_name='hospital',
            name='h_date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='organization',
            name='creation_date',
            field=models.DateField(auto_now_add=True),
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
            name='Date_of_birth',
            field=models.DateField(),
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
        migrations.AddField(
            model_name='comments',
            name='to_whom_id_doctor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.doctor'),
        ),
        migrations.AddField(
            model_name='comments',
            name='to_whom_id_hospital',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.hospital'),
        ),
        migrations.AddField(
            model_name='comments',
            name='to_whom_id_pharmacy',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='App_1.organization'),
        ),
        migrations.AddField(
            model_name='comments',
            name='user_foreign_key',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='App_1.patient'),
        ),
    ]
