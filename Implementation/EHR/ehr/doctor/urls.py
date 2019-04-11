from django.conf.urls import url
from doctor import views

app_name = 'doctor'
urlpatterns = [
    url(r'^$', views.Doctor, name='doctor'),
    url(r'^patiant/$',views.GetPatianTID , name='patiant_id'),
    url(r'^patiant/prescription/$',views.ReportListView.as_view() , name='prescriptionlist'),
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





]
