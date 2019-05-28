from django.conf.urls import url
from django.urls import path
from lab import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'lab'

urlpatterns = [
    path('', views.labLogin, name='labLogin'),
    path('logout/', views.labLogout, name='labLogout'),
    path('labPatientLogin/', views.labPatientLogin, name='labPatientLogin'),
    path('labPatientLogin/Analytics/', views.AnalyticsListView, name='AnalyticsListView'),
    path('labPatientLogin/Rays/', views.RaysListView, name='RaysListView'),
    url(r'^labProfileView/(?P<labid>\w+)/(?P<hosid>\w+)/$', views.lab_profile_view,name='lab_profile_view'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)