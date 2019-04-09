from django.contrib import admin
from .models import doctor,report,prescription
# Register your models here.

admin.site.register(doctor)
admin.site.register(report)
admin.site.register(prescription)
