from django.urls import path
from pharmacy import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'pharmacy'

urlpatterns = [
    path('', views.pharmacyLogin, name='pharmacyLogin'),
    path('medicines/',views.medicineListView, name = 'medicineListView'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)