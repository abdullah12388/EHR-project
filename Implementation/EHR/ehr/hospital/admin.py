from django.contrib import admin
from hospital.models import hospital, organization


class hospitalAdmin(admin.ModelAdmin):
    list_display = ['h_name', 'h_type', 'h_ownership', 'hos_rate', 'creation_date']

admin.site.register(hospital,hospitalAdmin)

class orgAdmin(admin.ModelAdmin):
    list_display = ['org_name', 'org_rate', 'Type', 'hospital_id', 'creation_date']

admin.site.register(organization,orgAdmin)