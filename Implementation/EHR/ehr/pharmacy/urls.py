from django.conf.urls import url
from pharmacy import views


urlpatterns = [
    url(r'^$', views.pharmacy, name='pharmacy'),
]