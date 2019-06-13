from django.contrib import admin
from .models import doctor,all_medicine,all_analytics,all_rays
# Register your models here.


class doctorAdmin(admin.ModelAdmin):
    list_display = ['Doc_id', 'University', 'Work_place', 'Working_till', 'Graduation_year','doc_rate','clinic_id','hospital_id']

admin.site.register(doctor,doctorAdmin)


class doctorMedicineAdmin(admin.ModelAdmin):
    list_display = ['medicine_id', 'medicine_name']

admin.site.register(all_medicine,doctorMedicineAdmin)

class doctorAnalyticsAdmin(admin.ModelAdmin):
    list_display = ['analytics_id', 'analytics_name']

admin.site.register(all_analytics,doctorAnalyticsAdmin)

class doctorRaysAdmin(admin.ModelAdmin):
    list_display = ['ray_id', 'ray_name']

admin.site.register(all_rays,doctorRaysAdmin)
