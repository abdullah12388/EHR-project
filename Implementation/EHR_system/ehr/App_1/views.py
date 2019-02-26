from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import AddManager, AddTemp, AddUser, tempRegister, login
from .models import admin, temp_register
from django.http import JsonResponse
# Create your views here.
def home(request):
    return render(request, 'home.html', {})




# def signup(request):
#     if request.method == 'POST':
#         form1 = AddManager(request.POST or None)
#         form2 = AddTemp(request.POST or None)
#         if form1.is_valid():
#             form1.save()
#             a = form1.cleaned_data.get('email')
#             admin_id = admin.objects.get(email = a).id
#             #print(admin_id)
#             if form2.is_valid():
#                 instance = form2.save(commit=False)
#                 instance.temp_id = admin_id
#                 instance.save()
#             #return HttpResponseRedirect('/login/')
#     else:
#         form1 = AddManager()
#         form2 = AddTemp()
#     context = {
#         'form1': form1,
#         'form2': form2
#     }
#     return render(request, 'signup.html', context)

def temp_Register(request):
    if request.method == 'POST':
        form = tempRegister(request.POST or None)
        if form.is_valid():
            instance = form.save(commit=False)
            password = form.cleaned_data.get('password')
            re_password = form.cleaned_data.get('re_password')
            if password != re_password:
                return HttpResponseRedirect('/signup/?a=1')
            else:
                instance.save()
                return HttpResponseRedirect('/login/')
    else:
        form = tempRegister()
    context = {
        'form': form
    }
    return render(request, 'signup.html', context)

def validate_email(request):
    email = request.GET.get('email', None)
    data = {
        # 'is_taken' : admin.objects.filter(email__iexact = email).exists()
        'is_taken' : temp_register.objects.filter(email__iexact = email).exists()
    }
    return JsonResponse(data)


def patientLogin(request):
    if request.method == 'POST':
        form = login(request.POST or None)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            user_is_exist = temp_register.objects.filter(email__iexact = email).exists()
            if user_is_exist:
                id = temp_register.objects.get(email=email).id
                password_db = temp_register.objects.get(email=email).password
                if password == password_db:
                    request.session['patient_id'] = id
                    return HttpResponseRedirect('/')
                else:
                    return HttpResponseRedirect('/login/?alert=wrong_password')
            else:
                return HttpResponseRedirect('/login/?alert=wrong_email')
    else:
        form = login()
    context = {
        'form': form
    }
    return render(request, 'login.html', context)


def test(request):
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

