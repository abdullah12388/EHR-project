from django.conf.urls import url
from Doctor_App import views

app_name = 'Doctor_App'

urlpatterns = [
    url(r'^$',views.doctor_index)
]
