# Generated by Django 2.0.5 on 2019-06-15 12:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('patient', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='email_2',
            field=models.EmailField(blank=True, max_length=100, null=True),
        ),
    ]
