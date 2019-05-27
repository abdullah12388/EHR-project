from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from patient.forms import tempRegister, login, AddUser, AddPatient, searchHistory
from doctor.models import (report, doctor, prescription, multi_analytics,
                           multi_chronic, multi_medecines, multi_rays,
                           patient_analytics, patient_chronic,
                           patient_medicine, patient_rays, all_analytics, all_medicine, all_rays, all_chronic)
from patient.models import user, patient, temp_register
from hospital.models import organization, hospital
from django.http import JsonResponse
from django.core.files.storage import FileSystemStorage
import qrcode, shutil, os
from datetime import date
from django.conf import settings as set
from django.contrib.auth.hashers import check_password
from django.db.models import Count


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

    def remove_from_temp(self, id):
        check = temp_register.objects.filter(id__iexact=id).exists()
        if check:
            temp_register.objects.get(pk=id).delete()
            print("Temp Deleted Successfully")
            return True
        else:
            print("Temp Not Found")
            return False

    def get_final_all_reports(self):
        return self.__final_all_reports

    def patient_login(self, request):
        temp_is_exist = temp_register.objects.filter(email__iexact=self.__patient_email).exists()
        user_is_exist = user.objects.filter(email_1__iexact=self.__patient_email).exists()
        if temp_is_exist:
            get = temp_register.objects.get(email=self.__patient_email)
            id = get.id
            password_db = get.password
            if check_password(password=self.__patient_password, encoded=password_db):
                request.session['patient_temp_id'] = id
                request.session['user_type'] = 'temp'
                if 'patient_temp_id' not in request.session:
                    print('THIS IS FALSE')
                self.patient_login_result = 'temp_email_exists'
            else:
                self.patient_login_result = 'wrong_password'
        elif user_is_exist:
            get = user.objects.get(email_1=self.__patient_email)
            user_id = get.user_id
            password_db = get.New_Password
            user_Type_number = get.User_type
            if user_Type_number == 2:
                doctor_id = doctor.objects.get(Doc=user_id).id
            else:
                patient_id = patient.objects.get(Patient_id=user_id).id

            if check_password(password=self.__patient_password, encoded=password_db) or 1:
                if user_Type_number == 2:
                    request.session['doctor_id'] = doctor_id
                    request.session['user_T'] = user_Type_number
                    request.session['Doctor_Patiant_ID'] = 0
                else:
                    request.session['patient_id'] = patient_id
                    request.session['user_type'] = 'registered_patient'
                    request.session['user_T'] = user_Type_number

                if 'patient_id' not in request.session or 'doctor_id' not in request.session:
                    print('THIS IS FALSE')
                self.patient_login_result = 'email_exists'
            else:
                self.patient_login_result = 'wrong_password'
        else:
            self.patient_login_result = 'wrong_email'
        return self.patient_login_result

    def patient_report_data(self, request):
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
        patient_id_session = request.session['patient_id']
        report_data = report.objects.filter(patient_id__exact=patient_id_session).order_by('-Submit_date')
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
                doctor_name = user.objects.get(user_id=user_id).first_name + " " + user.objects.get(
                    user_id=user_id).last_name
                doctor_names.append(doctor_name)
                prescription_detail.append(
                    prescription.objects.get(prescription_id=instance.prescription_id).Disease_disc)
                if instance.clinic_id == None:
                    clinic_names.append(False)
                else:
                    clinic_names.append(organization.objects.get(org_id=instance.clinic_id).org_name)
                if instance.hospital_id == None:
                    hospital_names.append(False)
                else:
                    hospital_names.append(hospital.objects.get(h_id=instance.hospital_id).h_name)
            all_report_data = [pk_list, doctor_id, patient_id, prescription_id, Submit_date, clinic_id, hospital_id,
                               doctor_names, prescription_detail, clinic_names, hospital_names]
            return all_report_data
        else:
            return False

    def get_multi(self, request):
        report_data = self.patient_report_data(request=request)
        if not report_data == False:
            report_id = report_data[0]
            # print("report_id",report_id)
            i = 0
            p_a_id, p_c_id, p_m_id, p_r_id = [[] for y in range(len(report_id))], [[] for y in range(len(report_id))], [
                [] for y in range(len(report_id))], [[] for y in range(len(report_id))]
            p_a_id_, p_c_id_, p_m_id_, p_r_id_ = [[] for y in range(len(report_id))], [[] for y in
                                                                                       range(len(report_id))], [[] for y
                                                                                                                in
                                                                                                                range(
                                                                                                                    len(
                                                                                                                        report_id))], [
                                                     [] for y in range(len(report_id))]
            analytics_name, medicine_name, ray_name, chronic_name = [[] for y in range(len(report_id))], [[] for y in
                                                                                                          range(len(
                                                                                                              report_id))], [
                                                                        [] for y in range(len(report_id))], [[] for y in
                                                                                                             range(len(
                                                                                                                 report_id))]
            for i in range(0, len(report_id)):
                multi_analytics_data = multi_analytics.objects.filter(report_id__exact=report_id[i]).exists()
                multi_chronic_data = multi_chronic.objects.filter(report_id__exact=report_id[i]).exists()
                multi_medicines_data = multi_medecines.objects.filter(report_id__exact=report_id[i]).exists()
                multi_rays_data = multi_rays.objects.filter(report_id__exact=report_id[i]).exists()
                if multi_analytics_data:
                    j = 0
                    analytics_list = multi_analytics.objects.filter(report_id__exact=report_id[i])
                    for instance in analytics_list:
                        p_a_id[i].insert(j, instance.P_A_id)
                        j = j + 1
                    # print("p_a_id = " , p_a_id)
                if multi_chronic_data:
                    j = 0
                    chronic_list = multi_chronic.objects.filter(report_id__exact=report_id[i])
                    for instance in chronic_list:
                        p_c_id[i].insert(j, instance.P_C_id)
                        j = j + 1
                    # print("p_c_id = ", p_c_id)
                if multi_medicines_data:
                    j = 0
                    medicines_list = multi_medecines.objects.filter(report_id__exact=report_id[i])
                    for instance in medicines_list:
                        p_m_id[i].insert(j, instance.P_M_id)
                        j = j + 1
                    # print("p_m_id = ", p_m_id)
                if multi_rays_data:
                    j = 0
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
                    analytic_name_ = all_analytics.objects.get(
                        analytics_id=patient_analytics_list.analy_id).analytics_name
                    analytics_name[i].insert(j, analytic_name_)
                for k in range(len(p_c_id[i])):
                    patient_chronic_list = patient_chronic.objects.get(P_C_id=p_c_id[i][k])
                    p_c_id_[i].insert(k, patient_chronic_list)
                    chronic_name_ = all_chronic.objects.get(chronic_id=patient_chronic_list.chr_id).chronic_name
                    chronic_name[i].insert(j, chronic_name_)
                for l in range(len(p_m_id[i])):
                    patient_medicine_list = patient_medicine.objects.get(P_M_id=p_m_id[i][l])
                    p_m_id_[i].insert(l, patient_medicine_list)
                    medicine_name_ = all_medicine.objects.get(medicine_id=patient_medicine_list.med_id).medicine_name
                    medicine_name[i].insert(j, medicine_name_)
                for m in range(len(p_r_id[i])):
                    patient_rays_list = patient_rays.objects.get(P_R_id=p_r_id[i][m])
                    p_r_id_[i].insert(m, patient_rays_list)
                    ray_name_ = all_rays.objects.get(ray_id=patient_rays_list.ray_id).ray_name
                    ray_name[i].insert(j, ray_name_)
            # print("p_a_id = ", p_a_id)
            # print("p_a_id_ = ", p_a_id_)
            # print("p_c_id = ", p_c_id)
            # print("p_c_id_ = ", p_c_id_)
            # print("p_m_id = ", p_m_id)
            # print("p_m_id_ = ", p_m_id_)
            # print("p_r_id = ", p_r_id)
            # print("p_r_id_ = ", p_r_id_)
            # print("p_a_id = ", p_a_id)
            # print("analytics_name = ", analytics_name)
            # print("p_c_id = ", p_c_id)
            # print("chronic_name = ", chronic_name)
            # print("p_m_id = ", p_m_id)
            # print("medicine_name = ", medicine_name)
            # print("p_r_id = ", p_r_id)
            print("ray_name = ", ray_name)
            self.__final_all_reports = [p_a_id_, p_c_id_, p_m_id_, p_r_id_, analytics_name, chronic_name, medicine_name,
                                        ray_name]
            return True
        else:
            return False


def home(request):
    # after finishing please change the comment below to get everything from session
    # patient_id = request.session['patient_id']
    patient_id = request.session['patient_id']
    topDoctor = doctor.objects.annotate(Count('doc_rate')).order_by('-doc_rate')[:50]
    topHospital = hospital.objects.annotate(Count('hos_rate')).order_by('-hos_rate')[:1]
    topLab = organization.objects.filter(Type__exact='1').annotate(Count('org_rate')).order_by('-org_rate')[:1]
    topPharmacy = organization.objects.filter(Type__exact='2').annotate(Count('org_rate')).order_by('-org_rate')[:1]
    ch = report.objects.filter(patient_id=patient_id).exists()
    # print(ch)
    if(ch):
        patientReport = report.objects.filter(patient_id__exact=patient_id).order_by('-Submit_date')[0]
    else:
        patientReport = report.objects.filter(patient_id__isnull=True)
    pharmacies = organization.objects.filter(Type__exact='1')
    labs = organization.objects.filter(Type__exact='2')
    clinics = organization.objects.filter(Type__exact='3')
    hospitals = hospital.objects.all()
    context = {
        'topDoctor': topDoctor,
        'topHospital': topHospital,
        'topLab': topLab,
        'topPharmacy': topPharmacy,
        'patientReport': patientReport,
        'pharmacies': pharmacies,
        'labs': labs,
        'hospitals': hospitals,
        'clinics':clinics,
    }
    if patientReport:
        lastMedicineInReportTrueOrFalse = multi_medecines.objects.filter(report__exact=patientReport.report).exists()
        if lastMedicineInReportTrueOrFalse:
            lastMedicineInReport = multi_medecines.objects.get(report__exact=patientReport.report)
            context.update({'lastMedicineInReport': lastMedicineInReport})

        lastAnalyticsInReportTrueOrFalse = multi_analytics.objects.filter(report__exact=patientReport.report).exists()
        if lastAnalyticsInReportTrueOrFalse:
            lastAnalyticsInReport = multi_analytics.objects.get(report__exact=patientReport.report)
            context.update({'lastAnalyticsInReport': lastAnalyticsInReport})

        lastRaysInReportTrueOrFalse = multi_rays.objects.filter(report__exact=patientReport.report).exists()
        if lastRaysInReportTrueOrFalse:
            lastRaysInReport = multi_rays.objects.get(report__exact=patientReport.report)
            context.update({'lastRaysInReport': lastRaysInReport})
    else:
        context={
            'topDoctor': topDoctor,
            'topHospital': topHospital,
            'topLab': topLab,
            'topPharmacy': topPharmacy,
            # 'patientReport': 'false',
            'pharmacies': pharmacies,
            'labs': labs,
            'hospitals': hospitals,
            # 'lastMedicineInReport': 'False',
            # 'lastAnalyticsInReport': 'False',
            # 'lastRaysInReport': 'False',
        }
        return render(request, 'patientIndex.html', context)

    return render(request, 'patientIndex.html', context)


def temp_Register(request):
    if request.method == 'POST':
        form = tempRegister(request.POST or None)
        if form.is_valid():
            instance = form.save(commit=False)
            password = form.cleaned_data.get('password')
            re_password = form.cleaned_data.get('re_password')
            if check_password(re_password, password):
                instance.save()
                # print("password = ", password)
                return HttpResponseRedirect('/patient/')
            else:
                # print(False)
                return HttpResponseRedirect('/patient/signup/?a=1')
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
        'is_taken': temp_register.objects.filter(email__iexact=email).exists()
    }
    return JsonResponse(data)


def valid_email(request):
    email1 = request.GET.get('email_1', None)
    # print(email1)
    data = {
        'is_taken': user.objects.filter(email_1__iexact=email1).exists()
    }
    return JsonResponse(data)


def patientLogin(request):
    if request.method == 'POST':
        form = login(request.POST or None)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            db = DB_functions()
            db.set_patient_email(email)
            db.set_patient_password(password)
            result = db.patient_login(request)
            if result == 'temp_email_exists':
                return HttpResponseRedirect('/patient/patientProfile/')
            elif result == 'email_exists':
                if request.session['user_T'] == 2:
                    return HttpResponseRedirect('/doctor')
                else:
                    return HttpResponseRedirect('/patient/Index/')
            elif result == 'wrong_password':
                return HttpResponseRedirect('/patient/?alert=wrong_password')
            elif result == 'wrong_email':
                return HttpResponseRedirect('/patient/?alert=wrong_email')

    else:
        form = login()
    context = {
        'form': form
    }
    return render(request, 'login.html', context)


def patientLogout(request):
    if request.session['user_T'] == 2:
        if 'doctor_id' in request.session:
            request.session.pop('doctor_id')
            print('SESSION FOUND')
        if 'doctor_id' not in request.session:
            print('SESSION DELETED')
    else:

        if 'patient_temp_id' in request.session:
            request.session.pop('patient_id')
            print('SESSION FOUND')
        if 'patient_id' in request.session:
            request.session.pop('patient_id')
            print('SESSION FOUND')
        if 'patient_id' not in request.session:
            print('SESSION DELETED')

    return HttpResponseRedirect('/patient/')


# patient profile functions
def patient_profile(request):
    if request.method == 'POST':
        form1 = AddUser(request.POST or None)
        form2 = AddPatient(request.POST or None)
        if form1.is_valid():
            # stop save in database
            instance1 = form1.save(commit=False)
            password = form1.cleaned_data.get('New_Password')
            con_password = form1.cleaned_data.get('Confirm_Pass')
            if not check_password(con_password, password):
                return HttpResponseRedirect('/patientProfile/?c=1')
            else:
                # upload profile,ssn pictures and save paths to database
                profile_picture_file = request.FILES['Profile_picture']
                ssn_picture_file = request.FILES['SSN_Picture']
                fs = FileSystemStorage()
                ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                spf_name = fs.save(ssn_picture_file.name, ssn_picture_file)
                instance1.Profile_picture = '/patient' + fs.url(ppf_name)
                instance1.SSN_Picture = '/patient' + fs.url(spf_name)
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
                genderMessage = gender(request.POST['gender'])
                maritalStatusMessage = maritalStatus(request.POST['marital_status'])
                if genderMessage == 'error':
                    return HttpResponseRedirect('/patient/patientProfile/')
                elif maritalStatusMessage == 'error':
                    return HttpResponseRedirect('/patient/patientProfile/')
                else:
                    instance1.gender = genderMessage
                    instance1.marital_status = maritalStatusMessage
                instance1.save()
                move(os.path.join('', img), os.path.join(set.MEDIA_ROOT, img))
                # get the user id with the email
                a = form1.cleaned_data.get('email_1')
                u_id = user.objects.get(email_1=a).user_id
                request.session['user_id'] = u_id
                if form2.is_valid():
                    instance2 = form2.save(commit=False)
                    instance2.Patient_id = u_id
                    instance2.QR_code = '/patient' + fs.url(img)
                    bloodTypeMessage = bloodType(request.POST['Blood_type'])
                    disabilityStatusMessage = disabilityStatus(request.POST['Disability_status'])
                    chronicDiseasesMessage = chronicDiseases(request.POST['Chronic_diseases'])
                    if bloodTypeMessage == 'error':
                        return HttpResponseRedirect('/patient/patientProfile/')
                    elif disabilityStatusMessage == 'error':
                        return HttpResponseRedirect('/patient/patientProfile/')
                    elif chronicDiseasesMessage == 'error':
                        return HttpResponseRedirect('/patient/patientProfile/')
                    else:
                        instance2.Blood_type = bloodTypeMessage
                        instance2.Disability_status = disabilityStatusMessage
                        instance2.Chronic_diseases = chronicDiseasesMessage
                    instance2.save()
                    db = DB_functions()
                    db.remove_from_temp(id=request.session['patient_temp_id'])
                    print('iam here')
                    return HttpResponseRedirect('/patient/patientCard/')
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
def gender(num):
    if num == '1':
        return 'male'
    elif num == '2':
        return 'female'
    elif num == '3':
        return 'other'
    else:
        return 'error'
def maritalStatus(num):
    if num == '1':
        return 'single'
    elif num == '2':
        return 'married'
    elif num == '3':
        return 'separated'
    elif num == '4':
        return 'divorced'
    elif num == '5':
        return 'widowed'
    else:
        return 'error'
def bloodType(num):
    if num == '1':
        return 'A+'
    elif num == '2':
        return 'A-'
    elif num == '3':
        return 'B+'
    elif num == '4':
        return 'B-'
    elif num == '5':
        return 'AB+'
    elif num == '6':
        return 'AB-'
    elif num == '7':
        return 'O+'
    elif num == '8':
        return 'O-'
    elif num == '9':
        return 'other'
    else:
        return 'error'
def disabilityStatus(num):
    if num == '1':
        return 'disabled'
    elif num == '2':
        return 'none'
    else:
        return 'error'
def chronicDiseases(num):
    if num == '1':
        return 'have'
    elif num == '2':
        return 'none'
    else:
        return 'error'
def move(src, dest):
    shutil.move(src, dest)
# end of patient profile


def patient_profile_view(request):
    patientdata = patient.objects.get(id=request.session['patient_id'])
    userdata = user.objects.get(user_id=patientdata.Patient_id)
    request.session['user_id'] = userdata.user_id
    context ={
        'user': userdata,
        'patient': patientdata,
    }
    return render(request, 'patientProfileView.html',context)

def patientHistory(request):
    global mix_1_1
    if request.method == 'POST':
        form = searchHistory(request.POST or None)
        form.save()
    else:
        form = searchHistory()
    context = {'form': form}
    db = DB_functions()
    mix_1 = db.patient_report_data(request=request)
    mix_2 = db.get_multi(request=request)
    mix_2_1 = db.get_final_all_reports()

    if not mix_1 == False and mix_2 == True:
        mix_1_1 = zip(mix_1[0], mix_1[1], mix_1[2], mix_1[3], mix_1[4], mix_1[5], mix_1[6], mix_1[7], mix_1[8],
                      mix_1[9], mix_1[10], mix_2_1[0], mix_2_1[1], mix_2_1[2], mix_2_1[3],
                      mix_2_1[4], mix_2_1[5], mix_2_1[6], mix_2_1[7])

        # print('report = ', mix_1[0])
        # print('NORMAL = ', mix_2_1[6])
        # print('REVERSED = ', list(reversed(mix_2_1[6])))
        context.update({
            'mix_1': mix_1_1,
        })
    # if not mix_2:
    #     mix_2_1 = zip(mix_2[0], mix_2[1], mix_2[2], mix_2[3])
    #     context.update({
    #         'mix_2': mix_2_1
    #     })
    return render(request, 'patientHistory.html', context)


def patientDoctor(request):
    return render(request, 'patientDoctor.html', {})


def patientCard(request):
    # print(request.session['user_id'])
    Profile_picture = user.objects.get(user_id=request.session['user_id']).Profile_picture
    first_name = user.objects.get(user_id=request.session['user_id']).first_name
    middle_name = user.objects.get(user_id=request.session['user_id']).middle_name
    last_name = user.objects.get(user_id=request.session['user_id']).last_name
    phone_number = user.objects.get(user_id=request.session['user_id']).phone_number
    Create_date = user.objects.get(user_id=request.session['user_id']).Create_date
    birthdate = user.objects.get(user_id=request.session['user_id']).Date_of_birth
    days_in_year = 365.2425
    age = int((date.today() - birthdate).days / days_in_year)
    # print(Profile_picture)
    # print(first_name)
    # print(middle_name)
    # print(last_name)
    # print(phone_number)
    # print(Create_date)
    # print(birthdate)
    # print(age)
    QR_code = patient.objects.get(Patient=request.session['user_id']).QR_code
    if age:
        context = {
            'Profile_picture': Profile_picture,
            'first_name': first_name,
            'middle_name': middle_name,
            'last_name': last_name,
            'phone_number': phone_number,
            'Create_date': Create_date,
            'QR_code': QR_code,
            'age': age,
        }
        return render(request, 'patientData.html', context)
    else:
        return HttpResponse('age:fail to calculate')
