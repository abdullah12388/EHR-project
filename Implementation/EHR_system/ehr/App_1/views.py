from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import AddManager
from .form import AddTemp
from .form import AddManager,AddUser
from .models import admin
from .models import temp

# Create your views here.
def home(request):
    return render(request, 'home.html', {})


def login(request):
    return render(request, 'login.html', {})


def signup(request):
    if request.method == 'POST':
        form1 = AddManager(request.POST or None)
        form2 = AddTemp(request.POST or None)
        if form1.is_valid():
            form1.save()
            a = form1.cleaned_data.get('email')
            admin_id = admin.objects.get(email = a).id
            #print(admin_id)
            if form2.is_valid():
                instance = form2.save(commit=False)
                instance.temp_id = admin_id
                instance.save()

            #return HttpResponseRedirect('/login/')
    else:
        form1 = AddManager()
        form2 = AddTemp()
    context = {
        'form1': form1,
        'form2': form2
    }
    return render(request, 'signup.html', context)


def test(request):
    a = admin.objects.get(pk=3)
    b = admin.objects.filter(id__iexact = 2).exists()
    if b:
        a = admin.objects.get(pk=3)
        a = a.email
    else:
        a = 'not found'
    #print(b)
    pk_list = []
    email_list = []
    c = admin.objects.filter(pk__gt=0)
    if c.exists():
        for instance in c:
            pk_list.append(instance.pk)
            email_list.append(instance.email)
    context = {
        'a': a,
        'pk_list': pk_list,
        'email_list': email_list,
    }
    return render(request, 'test.html', context)


def patientHistory(request):
    return render(request, 'patientHistory.html', {})

def patient_profile(request):
    form = AddUser()
    context = {
        'form': form
    }
    return render(request, 'patientProfile.html', context)

