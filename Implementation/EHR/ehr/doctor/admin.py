from django.contrib import admin

# Register your models here.
from doctor.models import report, patient_medicine, prescription, all_medicine

admin.site.register(report)
admin.site.register(patient_medicine)
admin.site.register(prescription)
admin.site.register(all_medicine)
