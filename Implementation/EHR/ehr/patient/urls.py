from django.conf.urls import url
from django.urls import path

from patient import views as view
from django.conf import settings
from django.conf.urls.static import static

app_name = 'patient'

urlpatterns = [
    path('', view.patientLogin, name='patientLogin'),
    url(r'^Index/$', view.home, name='home'),
    url(r'^logout/$', view.patientLogout, name='logout'),
    url(r'^patientProfile/$', view.patient_profile, name='patient_profile'),
    url(r'^patientProfileView/$', view.patient_profile_view, name='patient_profile_view'),
    url(r'^signup/$', view.temp_Register, name='signup'),
    url(r'^ajax/validate_email/$', view.validate_email, name='validate_email'),
    url(r'^profile/valid_email/$', view.valid_email, name='valid_email'),
    url(r'^patientHistory/$', view.patientHistory, name='patientHistory'),
    url(r'^patientCard/$', view.patientCard, name='patientCard'),
    url(r'^patientDoctor/$', view.patientDoctor, name='patientDoctor'),
    url(r'^QRScan/$', view.QRCodeScanView, name='QRCodeScanView'),


]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)