from django.contrib import admin
from .models import user
# Register your models here.
from patient.models import user, patient


class userAdmin(admin.ModelAdmin):
    list_display = ['Ssn_id', 'first_name', 'middle_name', 'last_name', 'email_1','User_type','Create_date']

admin.site.register(user,userAdmin)


class patientAdmin(admin.ModelAdmin):
    list_display = ['Patient_id', 'Emergency_contact', 'Disability_status', 'Chronic_diseases']

admin.site.register(patient,patientAdmin)
