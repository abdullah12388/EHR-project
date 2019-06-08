"""ehr URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include

from patient import views

urlpatterns = [
    url(r'^$', views.patientLogin, name='patientLogin'),
    url(r'^catalog/$', views.patientLogin, name='patientLogin'),
    url(r'^admin/', admin.site.urls),
    url(r'^doctor/', include('doctor.urls')),
    url(r'^patient/', include('patient.urls')),
    url(r'^hospital/', include('hospital.urls')),
    url(r'^clinic/', include('clinic.urls')),
    url(r'^predict/',include('predict_risk.urls')),
    path('pharmacy/', include('pharmacy.urls')),
    path('lab/', include('lab.urls')),
]

admin.site.site_header = "EHR ADMIN"
admin.site.site_title = "EHR ADMIN"
admin.site.index_title = "Welcome to EHR SYSTEM"
