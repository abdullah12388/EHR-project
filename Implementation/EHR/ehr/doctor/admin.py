from django.contrib import admin
from .models import doctor,report,prescription,all_medicine,multi_medecines,patient_medicine
# Register your models here.

admin.site.register(doctor)
admin.site.register(report)
admin.site.register(prescription)
admin.site.register(multi_medecines)
admin.site.register(patient_medicine)
from doctor.models import report, patient_medicine, prescription, all_medicine

admin.site.register(report)
admin.site.register(patient_medicine)
admin.site.register(prescription)
admin.site.register(all_medicine)
