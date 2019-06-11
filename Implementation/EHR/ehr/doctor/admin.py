from django.contrib import admin
from .models import doctor,report,prescription,all_medicine,multi_medecines,patient_medicine
# Register your models here.


class doctorAdmin(admin.ModelAdmin):
    list_display = ['Doc_id', 'University', 'Work_place', 'Working_till', 'Graduation_year','doc_rate','clinic_id','hospital_id']

admin.site.register(doctor,doctorAdmin)
