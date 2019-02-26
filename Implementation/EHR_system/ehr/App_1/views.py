from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import *
from .models import admin, user, temp_register
from django.core.files.storage import FileSystemStorage
import qrcode
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
                    if 'patient_id' not in request.session:
                        print('THIS IS TRUE')
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

def patientLogout(request):
    if 'patient_id' in request.session:
        request.session.pop('patient_id')
        print('SESSION FOUND')
    if 'patient_id' not in request.session:
        print('SESSION DELETED')
    return HttpResponseRedirect('/login/')

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
    if request.method == 'POST':

        form1 = AddUser(request.POST or None)
        form2 = AddPatient(request.POST or None)

        if form1.is_valid():

            # stop save in database
            instance1 = form1.save(commit=False)

            # upload profile,ssn pictures and save paths to database
            profile_picture_file = request.FILES['Profile_picture']
            ssn_picture_file = request.FILES['SSN_Picture']
            fs = FileSystemStorage()
            ppf_name = fs.save(profile_picture_file.name,profile_picture_file)
            spf_name = fs.save(ssn_picture_file.name,ssn_picture_file)
            instance1.Profile_picture = fs.url(ppf_name)
            instance1.SSN_Picture = fs.url(spf_name)

            # extract ssn id from full ssn
            ssn = instance1.Ssn
            ssn = ssn.replace('-', '')
            instance1.Ssn_id = ssn[7:14]

            qr = qrcode.QRCode(
                version=1,
                error_correction=qrcode.constants.ERROR_CORRECT_M,
                box_size=10,
                border=4,
            )
            qr.add_data(instance1.Ssn_id)
            qr.make(fit=True)
            qrc_id = qr.make_image()
            img_name = instance1.first_name
            img_exten = 'png'
            img = img_name + '.' + img_exten
            img_file = qrc_id.save(img)
            # qrcode_id = fs.save(img, img_file)
            instance1.save()

            # get the user id with the email
            a = form1.cleaned_data.get('email_1')
            u_id = user.objects.get(email_1=a).user_id

            if form2.is_valid():
                instance2 = form2.save(commit=False)
                instance2.Patient_id = u_id
                instance2.QR_code = fs.url(img_file)
                instance2.save()
                return HttpResponseRedirect('/login/')
            else:
                print('form two')
                print(form2.errors)
        else:
            print('form one')
            print(form1.errors)
    else:
        form1 = AddUser()
        form2 = AddPatient()
        context = {
            'form1': form1,
            'form2': form2,
        }
        return render(request, 'patientProfile.html', context)



def patientHistory(request):

    return render(request, 'patientHistory.html', {})

