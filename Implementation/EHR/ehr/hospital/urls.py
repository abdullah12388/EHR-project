from django.conf.urls import url
from hospital import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'hospital'

urlpatterns = [
    url(r'^$', views.hospitalLogin, name='hospitalLogin'),
    url(r'^Index/$', views.Index, name='Index'),
    url(r'^AddDoctor/$', views.add_doctor, name='add_doctor'),
    url(r'^AddPharmacy/$', views.add_pharmacy, name='add_pharmacy'),
    url(r'^AddLab/$', views.add_Lab, name='add_Lab'),
    url(r'^DeleteDoctor/(?P<Did>\w+)/$', views.delete_doctor, name='delete_doctor'),
    url(r'^DeletePharmayLab/(?P<ph_lb_id>\w+)/(?P<ph_lb_type>\w+)$', views.delete_pharmacy_lab, name='delete_pharmacy_lab'),
    url(r'^UnblockDoctor/(?P<ssn>\w+)/$', views.unblock_doctor, name='unblock_doctor'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)