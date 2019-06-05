from django.conf.urls import url
from clinic import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'clinic'

urlpatterns = [
    url(r'^$', views.clinicLogin, name='clinicLogin'),
    url(r'^Logout$', views.clinicLogout, name='clinicLogout'),
    url(r'^Index/$', views.Index, name='Index'),
    url(r'^AddClinicDoctor/$', views.add_doctor, name='add_doctor'),
    url(r'^updateClinicDoctor/(?P<Docid>\w+)/$', views.update_doctor, name='update_doctor'),
    url(r'^resetDocPassowrd/(?P<id>\w+)/$', views.reset_doc_passowrd, name='reset_doc_passowrd'),
    url(r'^clinicProfileView/(?P<clinid>\w+)/$', views.clinic_profile_view, name='clinic_profile_view'),
    url(r'^DeleteClinicDoctor/(?P<Did>\w+)/$', views.delete_doctor, name='delete_doctor'),
    url(r'^UnblockClinicDoctor/(?P<ssn>\w+)/$', views.unblock_doctor, name='unblock_doctor'),

    # url(r'^api/charts/data/$', views.HospitalStatistics.as_view(),name="api-data"),
    # url(r'^Statistics/$', views.StatView.as_view(),name="stat"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
