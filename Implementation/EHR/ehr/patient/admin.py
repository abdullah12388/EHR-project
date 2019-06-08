from django.contrib import admin
from .models import user
# Register your models here.
from patient.models import user, patient

admin.site.register(user)
admin.site.register(patient)
