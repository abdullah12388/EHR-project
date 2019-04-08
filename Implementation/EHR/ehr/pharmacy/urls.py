from django.urls import path
from pharmacy import views


urlpatterns = [
    path('', views.pharmacy, name='pharmacy'),
    path('medicines/',views.medicineListView.as_view(), name = 'medicines'),
]