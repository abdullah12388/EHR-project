from django.http import HttpResponseRedirect
<<<<<<< HEAD
from django.shortcuts import render,get_object_or_404
from App_1.form import AddManager
from App_1.models import admin, patient

=======
from django.shortcuts import render
from .form import AddManager,AddUser
from .models import admin
>>>>>>> e4de845ec72ddcdd9c7c2d5305ae661706348ebe

# Create your views here.
def home(request):
    return render(request, 'home.html', {})

def login(request):
    return render(request, 'login.html', {})

def signup(request):
    if request.method == 'POST':
        form = AddManager(request.POST or None)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/login/')
    else:
        form = AddManager()
    context = {
        'form': form
    }
    return render(request, 'signup.html', context)

def test(request):
    a = admin.objects.get(pk=1)
    pk_list = []
    email_list = []
    for instance in admin.objects.filter(pk__gt=0):
        pk_list.append(instance.pk)
        email_list.append(instance.email)
    context = {
        'a': a,
        'pk_list': pk_list,
        'email_list': email_list,
    }
    return render(request, 'test.html', context)

<<<<<<< HEAD
def patientIdentity(request, patient_id):
    patientData = get_object_or_404(patient, pk=patient_id)
    return render(request, 'patientIdentity.html', {'patient':patientData})
=======

def patient_profile(request):
    form = AddUser()
    context = {
        'form': form
    }
    return render(request, 'patientProfile.html', context)


def patientHistory(request):

    return render(request, 'patientHistory.html', {})
>>>>>>> e4de845ec72ddcdd9c7c2d5305ae661706348ebe
