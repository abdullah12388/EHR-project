from django.urls import path
from lab import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'lab'

urlpatterns = [
    path('', views.pharmacyLogin, name='pharmacyLogin'),
    path('pharmacyPatientLogin/', views.pharmacyPatientLogin, name='pharmacyPatientLogin'),
    path('pharmacyPatientLogin/medicines/', views.medicineListView, name='medicineListView'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)