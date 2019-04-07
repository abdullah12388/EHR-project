from django.conf.urls import url
from doctor import views


urlpatterns = [
    url(r'^$', views.doctor, name='doctor'),
]
