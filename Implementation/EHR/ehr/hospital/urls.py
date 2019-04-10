from django.conf.urls import url
from hospital import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'hospital'

urlpatterns = [
    url(r'^$', views.hospital, name='hospital'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)