from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from .form import AddManager,AddUser
from .models import admin , user , patient
from django.shortcuts import render
from .form import *
from .models import admin, user, temp_register, report
from django.core.files.storage import FileSystemStorage
import qrcode,shutil,os
from django.http import JsonResponse
from django.conf import settings as set

# Create your views here.

class DB_functions:
    __patient_email = ''
    __patient_password = ''
    patient_login_result = ''


    def set_patient_email(self, email):
        self.__patient_email = email
    def set_patient_password(self, password):
        self.__patient_password = password
    def patient_login(self, request):
        user_is_exist = temp_register.objects.filter(email__iexact=self.__patient_email).exists()
        if user_is_exist:
            id = temp_register.objects.get(email=self.__patient_email).id
            password_db = temp_register.objects.get(email=self.__patient_email).password
            if self.__patient_password == password_db:
                request.session['patient_id'] = id
                if 'patient_id' not in request.session:
                    print('THIS IS FALSE')
                self.patient_login_result = 'email_exists'
            else:
                self.patient_login_result = 'wrong_password'
        else:
            self.patient_login_result = 'wrong_email'
        return self.patient_login_result

    def calculateAge(Date_of_birth):
        oldDate = Date_of_birth
        today = date.today()
        return today.year - oldDate.year - ((today.month, today.day) < (oldDate.month, oldDate.day))

    def patient_report_data(self):
        pk_list = []
        doctor_id = []
        patient_id = []
        prescription_id = []
        Submit_date = []
        report_data = report.objects.order_by('-Submit_date')
        if report_data.exists():
            for instance in report_data:
                pk_list.append(instance.pk)
                doctor_id.append(instance.doctor_id)
                patient_id.append(instance.patient_id)
                prescription_id.append(instance.prescription_id)
                Submit_date.append(instance.Submit_date)
            mix = zip(pk_list, doctor_id, patient_id, prescription_id, Submit_date)
            return mix
        else:
            return False





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


def valid_email(request):
    email1 = request.GET.get('email_1', None)
    print(email1)
    data = {
        # 'is_taken' : admin.objects.filter(email__iexact = email).exists()
        'is_taken': user.objects.filter(email_1__iexact = email1).exists()
    }
    return JsonResponse(data)


def patientLogin(request):
    if request.method == 'POST':
        form = login(request.POST or None)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            db = DB_functions()
            db.set_patient_email(email)
            db.set_patient_password(password)
            result = db.patient_login(request)
            if result == 'email_exists':
                return HttpResponseRedirect('/patientProfile/')
            elif result == 'wrong_password':
                return HttpResponseRedirect('/login/?alert=wrong_password')
            elif result == 'wrong_email':
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

def patientHistory(request):
    if request.method == 'POST':
        form = searchHistory(request.POST or None)
        form.save()
    else:
        form = searchHistory()
    context = {'form': form}
    db = DB_functions()
    mix = db.patient_report_data()
    if not mix == False:
        context.update({'mix': mix})
    # pk_list = []
    # doctor_id = []
    # patient_id = []
    # prescription_id = []
    # Submit_date = []
    # report_data  = report.objects.order_by('-Submit_date')
    # if report_data.exists():
    #     for instance in report_data:
    #         pk_list.append(instance.pk)
    #         doctor_id.append(instance.doctor_id)
    #         patient_id.append(instance.patient_id)
    #         prescription_id.append(instance.prescription_id)
    #         Submit_date.append(instance.Submit_date)
    #     mix = zip(pk_list, doctor_id, patient_id, prescription_id, Submit_date)
    #     context.update( {
    #         'pk_list': pk_list,
    #         'doctor_id': doctor_id,
    #         'patient_id': patient_id,
    #         'prescription_id': prescription_id,
    #         'Submit_date': Submit_date,
    #         'mix': mix
    #     })
    return render(request, 'patientHistory.html', context)

def patient_profile(request):
    if request.method == 'POST':

        form1 = AddUser(request.POST or None)
        form2 = AddPatient(request.POST or None)

        if form1.is_valid():

            # stop save in database
            instance1 = form1.save(commit=False)

            password = form1.cleaned_data.get('New_Password')
            con_password = form1.cleaned_data.get('Confirm_Pass')
            if password != con_password:
                return HttpResponseRedirect('/patientProfile/?c=1')
            else:

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
                img_name = instance1.Ssn_id
                img_exten = 'png'
                img = img_name + '.' + img_exten
                qrc_id.save(img)
                instance1.save()

                move(os.path.join('',img),os.path.join(set.MEDIA_ROOT,img))

                # get the user id with the email
                a = form1.cleaned_data.get('email_1')
                u_id = user.objects.get(email_1=a).user_id

                if form2.is_valid():
                    instance2 = form2.save(commit=False)
                    instance2.Patient_id = u_id
                    instance2.QR_code = fs.url(img)
                    instance2.save()
                    return HttpResponseRedirect('/')
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



def move(src, dest):
    shutil.move(src, dest)

def patientData(request):
    id = request.GET.get('id', None)
    context = {}
    isFound = patient.objects.filter(id__iexact = id).exists()
    if isFound:
        data = patient.objects.get(pk=id)
        age = DB_functions.calculateAge(data.Patient.Date_of_birth)
        #khan = date.today().year - data.Patient.Date_of_birth.year - ((date.today().month, date.today().day) < (data.Patient.Date_of_birth.month, data.Patient.Date_of_birth.day))
        context = {
            'data': data,
            'age' : age
        }
    else:
        context.update({'data':'not_found'})
    return render(request,'patientData.html',context)

