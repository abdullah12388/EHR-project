from django.shortcuts import render

# Create your views here.
def doctor_index (request):
    return render (request , 'Doctor/doctor_index.html')
