from django.conf.urls import url
from lab import views


urlpatterns = [
    url(r'^$', views.lab, name='lab'),
]