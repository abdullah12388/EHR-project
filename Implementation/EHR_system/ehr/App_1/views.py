from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import AddManager, AddTemp, AddUser, AddPatient
from .models import admin,user
from django.core.files.storage import FileSystemStorage
import qrcode

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
    a = ''
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

