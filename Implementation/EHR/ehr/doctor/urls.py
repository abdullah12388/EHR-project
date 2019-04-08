from django.conf.urls import url
from doctor import views

app_name = 'doctor'
urlpatterns = [
    url(r'^$', views.doctor, name='doctor'),
    url(r'^patiant',views.GetPatianTID , name='patiant_id'),
]
