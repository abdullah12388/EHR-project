from django.contrib import admin

# Register your models here.
from patient.models import user, patient

admin.site.register(user)
admin.site.register(patient)
