from django.conf.urls import url
from hospital import views


urlpatterns = [
    url(r'^$', views.hospital, name='hospital'),
]
