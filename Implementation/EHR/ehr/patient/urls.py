from django.conf.urls import url
from patient import views as view
from django.conf import settings
from django.conf.urls.static import static

app_name = 'patient'

urlpatterns = [
    url(r'^$', view.home, name='home'),
    url(r'^login/$', view.patientLogin, name='login'),
    url(r'^logout/$', view.patientLogout, name='logout'),
    url(r'^patientProfile/$', view.patient_profile, name='patient_profile'),
    url(r'^signup/$', view.temp_Register, name='signup'),
    url(r'^ajax/validate_email/$', view.validate_email, name='validate_email'),
    url(r'^ajax/valid_email/$', view.valid_email, name='valid_email'),
    url(r'^patientHistory/$', view.patientHistory, name='patientHistory'),
    url(r'^patientDoctor/$', view.patientDoctor, name='patientDoctor'),

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)