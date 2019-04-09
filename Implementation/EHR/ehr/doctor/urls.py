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

]
