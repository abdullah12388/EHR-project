
from django.http import HttpResponseRedirect
from django.shortcuts import render
from .form import AddManager,AddUser
from .models import admin
from django.shortcuts import render
from .form import *
from .models import admin, user, temp_register, report
from django.core.files.storage import FileSystemStorage
import qrcode,shutil,os
from django.http import JsonResponse
# Create your views here.

class DB_functions:
    __patient_email = ''
    __patient_password = ''
    __final_all_reports = []
    patient_login_result = ''

    def set_patient_email(self, email):
        self.__patient_email = email
    def set_patient_password(self, password):
        self.__patient_password = password
    def get_final_all_reports(self):
        return self.__final_all_reports

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

    def patient_report_data(self):
        pk_list = []
        doctor_id = []
        patient_id = []
        prescription_id = []
        Submit_date = []
        clinic_id = []
        hospital_id = []
        doctor_names = []
        prescription_detail = []
        clinic_names = []
        hospital_names = []
        report_data = report.objects.order_by('-Submit_date')
        if report_data.exists():
            for instance in report_data:
                pk_list.append(instance.pk)
                doctor_id.append(instance.doctor_id)
                patient_id.append(instance.patient_id)
                prescription_id.append(instance.prescription_id)
                Submit_date.append(instance.Submit_date)
                clinic_id.append(instance.clinic_id)
                hospital_id.append(instance.hospital_id)
                user_id = doctor.objects.get(id=instance.doctor_id).Doc_id
                doctor_name = user.objects.get(user_id=user_id).first_name + " " + user.objects.get(user_id=user_id).last_name
                doctor_names.append(doctor_name)
                prescription_detail.append(prescription.objects.get(prescription_id=instance.prescription_id).Disease_disc)
                if instance.clinic_id == None:
                    clinic_names.append(False)
                else:
                    clinic_names.append(organization.objects.get(org_id=instance.clinic_id).org_name)
                if instance.hospital_id == None:
                    hospital_names.append(False)
                else:
                    hospital_names.append(hospital.objects.get(h_id=1).h_name)
            all_report_data = [pk_list, doctor_id, patient_id, prescription_id, Submit_date, clinic_id, hospital_id, doctor_names, prescription_detail, clinic_names, hospital_names]
            return all_report_data
        else:
            return False

    def get_multi(self):
        report_data = self.patient_report_data()
        if not report_data == False:
            report_id = report_data[0]
            print("report_id",report_id)
            i=0
            p_a_id, p_c_id, p_m_id, p_r_id  = [[] for y in range(len(report_id))], [[] for y in range(len(report_id))], [[] for y in range(len(report_id))], [[] for y in range(len(report_id))]
            p_a_id_, p_c_id_, p_m_id_, p_r_id_  = [[] for y in range(len(report_id))], [[] for y in range(len(report_id))], [[] for y in range(len(report_id))], [[] for y in range(len(report_id))]

            for i in range(0, len(report_id)):
                multi_analytics_data = multi_analytics.objects.filter(report_id__exact=report_id[i]).exists()
                multi_chronic_data = multi_chronic.objects.filter(report_id__exact=report_id[i]).exists()
                multi_medicines_data = multi_medecines.objects.filter(report_id__exact=report_id[i]).exists()
                multi_rays_data = multi_rays.objects.filter(report_id__exact=report_id[i]).exists()
                if multi_analytics_data:
                    j=0
                    analytics_list = multi_analytics.objects.filter(report_id__exact=report_id[i])
                    for instance in analytics_list:
                        p_a_id[i].insert(j, instance.P_A_id)
                        j = j+1
                    # print("p_a_id = " , p_a_id)
                if multi_chronic_data:
                    j=0
                    chronic_list = multi_chronic.objects.filter(report_id__exact=report_id[i])
                    for instance in chronic_list:
                        p_c_id[i].insert(j, instance.P_C_id)
                        j = j + 1
                    # print("p_c_id = ", p_c_id)
                if multi_medicines_data:
                    j=0
                    medicines_list = multi_medecines.objects.filter(report_id__exact=report_id[i])
                    for instance in medicines_list:
                        p_m_id[i].insert(j, instance.P_M_id)
                        j = j + 1
                    # print("p_m_id = ", p_m_id)
                if multi_rays_data:
                    j=0
                    rays_list = multi_rays.objects.filter(report_id__exact=report_id[i])
                    for instance in rays_list:
                        p_r_id[i].insert(j, instance.P_R_id)
                        j = j + 1
                    # print("p_r_id = ", p_r_id)
            result = [p_a_id, p_c_id, p_m_id, p_r_id]
            for i in range(len(report_id)):
                j, k, l, m = 0, 0, 0, 0
                for j in range(len(p_a_id[i])):
                    patient_analytics_list = patient_analytics.objects.get(P_A_id=p_a_id[i][j])
                    p_a_id_[i].insert(j, patient_analytics_list)
                for k in range(len(p_c_id[i])):
                    patient_chronic_list = patient_chronic.objects.get(P_C_id=p_c_id[i][k])
                    p_c_id_[i].insert(k, patient_chronic_list)
                for l in range(len(p_m_id[i])):
                    patient_medicine_list = patient_medicine.objects.get(P_M_id=p_m_id[i][l])
                    p_m_id_[i].insert(l, patient_medicine_list)
                for m in range(len(p_r_id[i])):
                    patient_rays_list = patient_rays.objects.get(P_R_id=p_r_id[i][m])
                    p_r_id_[i].insert(m, patient_rays_list)
            print("p_a_id = ", p_a_id)
            print("p_a_id_ = ", p_a_id_)
            print("p_c_id = ", p_c_id)
            print("p_c_id_ = ", p_c_id_)
            print("p_m_id = ", p_m_id)
            print("p_m_id_ = ", p_m_id_)
            print("p_r_id = ", p_r_id)
            print("p_r_id_ = ", p_r_id_)
            self.__final_all_reports = [p_a_id_, p_c_id_, p_m_id_, p_r_id_]
            return True
        else:
            return False

def home(request):
    return render(request, 'home.html', {})

"""
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
"""

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
    global mix_1_1
    if request.method == 'POST':
        form = searchHistory(request.POST or None)
        form.save()
    else:
        form = searchHistory()
    context = {'form': form}
    db = DB_functions()
    mix_1 = db.patient_report_data()
    mix_2 = db.get_multi()
    mix_2_1 = db.get_final_all_reports()
    if not mix_1 == False and mix_2 == True:
        mix_1_1 = zip(mix_1[0], mix_1[1], mix_1[2], mix_1[3], mix_1[4], mix_1[5], mix_1[6], mix_1[7], mix_1[8], mix_1[9], mix_1[10], mix_2_1[0], mix_2_1[1], mix_2_1[2], mix_2_1[3])
        context.update({
            'mix_1': mix_1_1,
        })
    # if not mix_2:
    #     mix_2_1 = zip(mix_2[0], mix_2[1], mix_2[2], mix_2[3])
    #     context.update({
    #         'mix_2': mix_2_1
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
def patientDoctor(request):
    return render(request,'patientDoctor.html',{})