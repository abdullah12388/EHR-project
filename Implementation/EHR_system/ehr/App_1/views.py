from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import AddManager
from .form import AddTemp
from .models import admin

# Create your views here.
def home(request):
    return render(request, 'home.html', {})

def login(request):
    return render(request, 'login.html', {})

def signup(request):
    if request.method == 'POST':
        form = AddManager(request.POST or None)
        form2 = AddTemp(request.POST or None)
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
    a = admin.objects.get(pk=3)
    b = admin.objects.filter(id__iexact = 2).exists()
    c = ''
    if b:
        a = admin.objects.get(pk=3)
        a = a.email
    else:
        a = 'not found'
    #print(b)
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

def patientHistory(request):
    return render(request, 'patientHistory.html', {})