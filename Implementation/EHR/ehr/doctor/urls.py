from django.conf.urls import url
from doctor import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'doctor'
urlpatterns = [
    url(r'^Home/$', views.Doctor, name='doctor'),
    url(r'^resetpassword/$', views.RestDoctorPassword,name='resetpassword'),
    url(r'^$',views.GetPatianTID , name='patiant_id'),
    url(r'^patiant/prescription/$',views.ReportListView.as_view() , name='prescriptionlist'),
    url(r'^doctorProfileView/(?P<pk>[-\w]+)/$',views.doctorProfileDetialView.as_view(), name='doctorProfileView'),
    url(r'^patiant/prescription/(?P<pk>[-\w]+)/$',views.PrescriptionDetialView.as_view() , name='prescriptiondetial'),
    url(r'^prescription/newcreate/$',views.prescriptionFormView.as_view(),name='presc_create'),
    url(r'^prescription/update/(?P<pk>[-\w]+)/$',views.prescriptionUpdate.as_view(),name='update'),

    url(r'^patiant/prescription/(?P<pk>[-\w]+)/medecines/$',views.Medicen_List.as_view(),name='medlist'),
    url(r'^patiant/prescription/medecines/(?P<pk>[-\w]+)/$',views.Medicin_DetialView.as_view(),name='meddital'),
    url(r'^patiant/prescription/medecines/update/(?P<pk>[-\w]+)/$' , views.Medicen_UPDATE.as_view(),name='medupdate'),
    url(r'^patiant/prescription/medecines/newcreate/(?P<pk>[-\w]+)/$',views.MedicenFormView.as_view(),name='newmed'),

    url(r'^patiant/prescription/(?P<pk>[-\w]+)/rays/$',views.rays_List.as_view(),name='rayslist'),
    url(r'^patiant/prescription/rays/(?P<pk>[-\w]+)/$',views.rays_DetialView.as_view(),name='raydetial'),
    url(r'^patiant/prescription/rays/update/(?P<pk>[-\w]+)/$' , views.rays_UPDATE.as_view(),name='raysupdate'),
    url(r'^patiant/prescription/rays/newcreate/(?P<pk>[-\w]+)/$',views.raysFormView.as_view(),name='newray'),

    url(r'^patiant/prescription/(?P<pk>[-\w]+)/analytics/$',views.analytics_List.as_view(),name='analyticslist'),
    url(r'^patiant/prescription/analytics/(?P<pk>[-\w]+)/$',views.analytics_DetialView.as_view(),name='analyticsdetial'),
    url(r'^patiant/prescription/analytics/update/(?P<pk>[-\w]+)/$' , views.analytics_UPDATE.as_view(),name='analyticssupdate'),
    url(r'^patiant/prescription/analytics/newcreate/(?P<pk>[-\w]+)/$',views.analyticsFormView.as_view(),name='newanalytics'),

    # url(r'^doctorProfileView/$', views.doctor_profile_view, name='doctor_profile_view'),
    # url(r'^doctorProfileView/(?P<docid>\w+)/$', views.doctor_profile_view,name='doctor_profile_view'),
    url(r'^QRScan/$', views.QRCodeScanView, name='QRCodeScanView'),
    # url(r'^medi/$', views.medi, name='medi'),
    url(r'^QRScan/$', views.QRCodeScanView, name='QRCodeScanView'),
    url(r'^api/charts/data/$', views.DoctorStatistics.as_view(),name="api-data"),
    url(r'^Statistics/$', views.StatView.as_view(),name="stat"),

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
