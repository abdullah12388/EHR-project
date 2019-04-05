from django.contrib import admin
from App_1.models import (hospital,organization,doctor,patient_rays,patient_chronic
,patient_medicine,patient_analytics,all_medicine,all_rays,all_analytics,report,prescription
,multi_rays,multi_analytics,multi_medecines)
# Register your models here.
admin.site.register(hospital)
admin.site.register(organization)
admin.site.register(doctor)
admin.site.register(patient_rays)
admin.site.register(patient_chronic)
admin.site.register(patient_medicine)
admin.site.register(patient_analytics)
admin.site.register(all_medicine)
admin.site.register(all_analytics)
admin.site.register(all_rays)
admin.site.register(report)
admin.site.register(prescription)
admin.site.register(multi_rays)
admin.site.register(multi_analytics)
admin.site.register(multi_medecines)
