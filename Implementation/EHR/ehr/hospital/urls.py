from django.conf.urls import url
from hospital import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'hospital'

urlpatterns = [
    url(r'^$', views.hospitalLogin, name='hospitalLogin'),
    url(r'^Logout$', views.hospitalLogout, name='hospitalLogout'),
    url(r'^Index/$', views.Index, name='Index'),
    url(r'^AddHospitalDoctor/$', views.add_doctor, name='add_doctor'),
    url(r'^updateHospitalDoctor/(?P<Docid>\w+)/$', views.update_doctor, name='update_doctor'),
    url(r'^updatePharmacy/(?P<pharid>\w+)/(?P<hosid>\w+)/$', views.update_pharmacy, name='update_pharmacy'),
    url(r'^updateLab/(?P<labid>\w+)/(?P<hosid>\w+)/$', views.update_lab, name='update_lab'),
    url(r'^resetHospitalDoctorPassowrd/(?P<id>\w+)/$', views.reset_doc_passowrd, name='reset_doc_passowrd'),
    url(r'^AddPharmacy/$', views.add_pharmacy, name='add_pharmacy'),
    url(r'^AddLab/$', views.add_Lab, name='add_Lab'),
    url(r'^hospitalProfileView/(?P<hosid>\w+)/$', views.hospital_profile_view, name='hospital_profile_view'),
    url(r'^DeleteHospitalDoctor/(?P<Did>\w+)/$', views.delete_doctor, name='delete_doctor'),
    url(r'^DeletePharmayLab/(?P<ph_lb_id>\w+)/(?P<ph_lb_type>\w+)$', views.delete_pharmacy_lab, name='delete_pharmacy_lab'),
    url(r'^UnblockHospitalDoctor/(?P<ssn>\w+)/$', views.unblock_doctor, name='unblock_doctor'),

    url(r'^api/charts/data/$', views.HospitalStatistics.as_view(),name="api-data"),
    url(r'^Statistics/$', views.StatView.as_view(),name="stat"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
