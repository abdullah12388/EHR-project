from django.shortcuts import render
from patient.models import user,patient
from hospital.models import hospital,organization

# Create your views here.


def doctor(request):
    return render(request, 'test.html', {})
