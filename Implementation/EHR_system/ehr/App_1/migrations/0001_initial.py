# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='admin',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='all_analytics',
            fields=[
                ('analytics_id', models.AutoField(primary_key=True, serialize=False)),
                ('analytics_name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='all_chronic',
            fields=[
                ('chronic_id', models.AutoField(primary_key=True, serialize=False)),
                ('chronic_name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='all_medicine',
            fields=[
                ('medicine_id', models.AutoField(primary_key=True, serialize=False)),
                ('medicine_name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='all_rays',
            fields=[
                ('ray_id', models.AutoField(primary_key=True, serialize=False)),
                ('ray_name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='blocked_hospitals',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='blocked_organizations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='blocked_users',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='doctor',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('Registration_num', models.CharField(max_length=50)),
                ('Specialization', models.CharField(max_length=100)),
                ('Registration_date', models.DateTimeField(auto_now_add=True)),
                ('licence', models.CharField(max_length=250)),
                ('Last_date_payment', models.DateTimeField(auto_now=True)),
                ('End_date', models.DateTimeField(auto_now=True)),
                ('Specialization_type', models.CharField(max_length=100)),
                ('University', models.CharField(max_length=100)),
                ('Work_place', models.CharField(max_length=100)),
                ('Sub_syndicate', models.CharField(max_length=500)),
                ('General_secretary', models.CharField(max_length=500)),
                ('Working_till', models.DateTimeField(auto_now=True)),
                ('Graduation_year', models.CharField(max_length=50)),
                ('doc_rate', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='hospital',
            fields=[
                ('h_id', models.AutoField(primary_key=True, serialize=False)),
                ('h_name', models.CharField(max_length=500)),
                ('h_country', models.CharField(max_length=100)),
                ('h_state', models.CharField(max_length=100)),
                ('h_city', models.CharField(max_length=100)),
                ('h_street', models.CharField(max_length=100)),
                ('h_zipcode', models.CharField(max_length=50)),
                ('h_phone_num', models.CharField(max_length=100)),
                ('h_type', models.CharField(max_length=100)),
                ('h_ownership', models.CharField(max_length=100)),
                ('h_emergency_service', models.BooleanField()),
                ('h_date', models.DateTimeField(auto_now_add=True)),
                ('email', models.EmailField(max_length=100)),
                ('website', models.TextField()),
                ('logo', models.TextField()),
                ('internal_medicine', models.IntegerField()),
                ('cardiology', models.IntegerField()),
                ('endocrinology', models.IntegerField()),
                ('hematology', models.IntegerField()),
                ('nephrology', models.IntegerField()),
                ('surgery', models.IntegerField()),
                ('pediatric', models.IntegerField()),
                ('obstertics_genacology', models.IntegerField()),
                ('ophthalmologist', models.IntegerField()),
                ('neurology', models.IntegerField()),
                ('Ear_nose_threat', models.IntegerField()),
                ('urology', models.IntegerField()),
                ('dermatology', models.IntegerField()),
                ('hepatology', models.IntegerField()),
                ('Radiology', models.IntegerField()),
                ('psychiatry', models.IntegerField()),
                ('dentistry', models.IntegerField()),
                ('forensic_medicine', models.IntegerField()),
                ('enatony', models.IntegerField()),
                ('num_of_bed', models.IntegerField()),
                ('hr_username', models.CharField(max_length=250)),
                ('hr_password', models.CharField(max_length=250)),
                ('creation_date', models.DateTimeField()),
                ('hos_rate', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='manager',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=255)),
                ('country', models.CharField(max_length=255)),
                ('state', models.CharField(max_length=255)),
                ('city', models.CharField(max_length=255)),
                ('phone_number', models.CharField(max_length=255)),
                ('blocked', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='multi_analytics',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='multi_chronic',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='multi_medecines',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='multi_rays',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
            ],
        ),
        migrations.CreateModel(
            name='organization',
            fields=[
                ('org_id', models.AutoField(primary_key=True, serialize=False)),
                ('org_name', models.CharField(max_length=250)),
                ('org_country', models.CharField(max_length=100)),
                ('org_state', models.CharField(max_length=100)),
                ('org_city', models.CharField(max_length=100)),
                ('org_zipcode', models.CharField(max_length=100)),
                ('org_phone_num', models.CharField(max_length=50)),
                ('org_email', models.EmailField(max_length=100)),
                ('org_website', models.TextField()),
                ('org_logo', models.TextField()),
                ('hr_username', models.CharField(max_length=100)),
                ('hr_password', models.CharField(max_length=100)),
                ('creation_date', models.DateTimeField(auto_now_add=True)),
                ('org_rate', models.IntegerField()),
                ('Type', models.IntegerField()),
                ('hospital_id', models.ForeignKey(to='App_1.hospital')),
            ],
        ),
        migrations.CreateModel(
            name='patient',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('Emergency_contact', models.CharField(max_length=50)),
                ('QR_code', models.TextField()),
                ('Disability_status', models.BooleanField(default=False)),
                ('Height', models.FloatField()),
                ('weight', models.FloatField()),
                ('Blood_type', models.CharField(max_length=50)),
                ('Chronic_diseases', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='patient_analytics',
            fields=[
                ('P_A_id', models.AutoField(primary_key=True, serialize=False)),
                ('analytics_result', models.TextField()),
                ('analy_id', models.ForeignKey(to='App_1.all_analytics')),
                ('lab_id', models.ForeignKey(to='App_1.organization')),
                ('pat_id', models.ForeignKey(to='App_1.patient')),
            ],
        ),
        migrations.CreateModel(
            name='patient_chronic',
            fields=[
                ('P_C_id', models.AutoField(primary_key=True, serialize=False)),
                ('chr_id', models.ForeignKey(to='App_1.all_chronic')),
                ('pat_id', models.ForeignKey(to='App_1.patient')),
            ],
        ),
        migrations.CreateModel(
            name='patient_medicine',
            fields=[
                ('P_M_id', models.AutoField(primary_key=True, serialize=False)),
                ('number_of_potions', models.IntegerField()),
                ('number_of_pills', models.IntegerField()),
                ('medicine_submit', models.BooleanField(default=False)),
                ('med_id', models.ForeignKey(to='App_1.all_medicine')),
                ('pat_id', models.ForeignKey(to='App_1.patient')),
                ('pharmacy_id', models.ForeignKey(to='App_1.organization')),
            ],
        ),
        migrations.CreateModel(
            name='patient_rays',
            fields=[
                ('P_R_id', models.AutoField(primary_key=True, serialize=False)),
                ('rays_result', models.TextField()),
                ('lab_id', models.ForeignKey(to='App_1.organization')),
                ('pat_id', models.ForeignKey(to='App_1.patient')),
                ('ray_id', models.ForeignKey(to='App_1.all_rays')),
            ],
        ),
        migrations.CreateModel(
            name='prescription',
            fields=[
                ('prescription_id', models.AutoField(primary_key=True, serialize=False)),
                ('Disease_name', models.CharField(max_length=100)),
                ('Disease_level', models.CharField(max_length=100)),
                ('Disease_disc', models.TextField()),
                ('Doctor_signature', models.CharField(max_length=500)),
                ('next_appointment', models.DateTimeField()),
                ('Submit_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='report',
            fields=[
                ('report_id', models.AutoField(primary_key=True, serialize=False)),
                ('doctor_id', models.ForeignKey(to='App_1.doctor')),
                ('patient_id', models.ForeignKey(to='App_1.patient')),
                ('prescription_id', models.ForeignKey(to='App_1.prescription')),
            ],
        ),
        migrations.CreateModel(
            name='user',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=100)),
                ('middle_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('gender', models.IntegerField()),
                ('country', models.CharField(max_length=100)),
                ('state', models.CharField(max_length=100)),
                ('city', models.CharField(max_length=100)),
                ('street', models.CharField(max_length=100)),
                ('zip_code', models.CharField(max_length=100)),
                ('phone_number', models.CharField(max_length=100)),
                ('home_phone_number', models.CharField(max_length=100)),
                ('work_phone_number', models.CharField(max_length=100)),
                ('Date_of_birth', models.CharField(max_length=100)),
                ('marital_status', models.CharField(max_length=100)),
                ('Child_num', models.CharField(max_length=100)),
                ('email_1', models.EmailField(max_length=100)),
                ('email_2', models.EmailField(max_length=100)),
                ('Nationality', models.CharField(max_length=100)),
                ('Profile_picture', models.CharField(max_length=100)),
                ('Job_name', models.CharField(max_length=100)),
                ('Job_organization', models.CharField(max_length=100)),
                ('Jop_place', models.CharField(max_length=100)),
                ('Ssn', models.CharField(max_length=100)),
                ('Ssn_id', models.CharField(max_length=100)),
                ('Password', models.CharField(max_length=100)),
                ('SSN_Picture', models.CharField(max_length=100)),
                ('User_type', models.IntegerField()),
                ('Create_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.AddField(
            model_name='patient',
            name='Patient_id',
            field=models.ForeignKey(to='App_1.user'),
        ),
        migrations.AddField(
            model_name='multi_rays',
            name='P_R_id',
            field=models.ForeignKey(to='App_1.patient_rays'),
        ),
        migrations.AddField(
            model_name='multi_rays',
            name='report_id',
            field=models.ForeignKey(to='App_1.report'),
        ),
        migrations.AddField(
            model_name='multi_medecines',
            name='P_M_id',
            field=models.ForeignKey(to='App_1.patient_medicine'),
        ),
        migrations.AddField(
            model_name='multi_medecines',
            name='report_id',
            field=models.ForeignKey(to='App_1.report'),
        ),
        migrations.AddField(
            model_name='multi_chronic',
            name='P_C_id',
            field=models.ForeignKey(to='App_1.patient_chronic'),
        ),
        migrations.AddField(
            model_name='multi_chronic',
            name='report_id',
            field=models.ForeignKey(to='App_1.report'),
        ),
        migrations.AddField(
            model_name='multi_analytics',
            name='P_A_id',
            field=models.ForeignKey(to='App_1.patient_analytics'),
        ),
        migrations.AddField(
            model_name='multi_analytics',
            name='report_id',
            field=models.ForeignKey(to='App_1.report'),
        ),
        migrations.AddField(
            model_name='doctor',
            name='Doc_id',
            field=models.ForeignKey(to='App_1.user'),
        ),
        migrations.AddField(
            model_name='doctor',
            name='clinic_id',
            field=models.ForeignKey(to='App_1.organization'),
        ),
        migrations.AddField(
            model_name='doctor',
            name='hospital_id',
            field=models.ForeignKey(to='App_1.hospital'),
        ),
        migrations.AddField(
            model_name='blocked_users',
            name='manager_id',
            field=models.ForeignKey(to='App_1.manager'),
        ),
        migrations.AddField(
            model_name='blocked_users',
            name='user_id',
            field=models.ForeignKey(to='App_1.user'),
        ),
        migrations.AddField(
            model_name='blocked_organizations',
            name='manager_id',
            field=models.ForeignKey(to='App_1.manager'),
        ),
        migrations.AddField(
            model_name='blocked_organizations',
            name='organ_id',
            field=models.ForeignKey(to='App_1.organization'),
        ),
        migrations.AddField(
            model_name='blocked_hospitals',
            name='hospital_id',
            field=models.ForeignKey(to='App_1.hospital'),
        ),
        migrations.AddField(
            model_name='blocked_hospitals',
            name='manager_id',
            field=models.ForeignKey(to='App_1.manager'),
        ),
    ]
