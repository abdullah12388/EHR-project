from django.contrib.auth.hashers import check_password
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotFound
from django.shortcuts import render, get_object_or_404

from doctor.models import doctor
from hospital.models import organization
from patient.forms import AddUser
from patient.models import user


# Create your views here.


def clinicLogin(request):
    if request.method == 'POST':
        clinicName = request.POST['clinic_name']
        clinicPass = request.POST['clinic_pass']
        clinicUserFound = organization.objects.filter(hr_username__exact=clinicName).exists()
        clinicPassFound = organization.objects.filter(hr_password__exact=clinicPass).exists()
        if clinicUserFound:
            if clinicPassFound:
                cln_id = organization.objects.filter(Type=3).filter(hr_password=clinicPass).get(
                    hr_username=clinicName).org_id
                request.session['clinic_id'] = cln_id
                request.session['type'] = 'clinic'
                return HttpResponseRedirect('Index/')
            else:
                print('wrong password')
                return HttpResponse("You entered wrong pass")
        else:
            print('clinic not exists')
            return HttpResponseNotFound('<h1>clinic not found</h1>')
    else:
        request.session['type'] = 'clinic'
        return render(request, 'clinicLogin.html', {})


def clinicLogout(request):
    if request.session['type'] == 'clinic':
        if 'clinic_id' in request.session:
            request.session.pop('clinic_id')
            print('SESSION FOUND')
        if 'clinic_id' not in request.session:
            print('SESSION DELETED')
    else:
        print('there is no clinic entered')
    return HttpResponseRedirect('/clinic/')


def Index(request):
    if 'clinic_id' in request.session:
        doctordata = doctor.objects.filter(clinic_id=request.session['clinic_id'])
        clinicdata = organization.objects.filter(Type=3).get(org_id=request.session['clinic_id'])
        print(clinicdata)
        context = {
            'clinic': clinicdata,
            'clin_id': clinicdata.org_id,
            'doctor': doctordata,
            'first_name':clinicdata.org_name
        }
        return render(request, 'clinicIndex.html', context)
    else:
        return HttpResponseRedirect('/clinic/')


def update_doctor(request, Docid):
    if 'clinic_id' in request.session:
        if request.method == 'POST':
            usr = user.objects.filter(user_id=Docid)
            # upload profile,ssn pictures and save paths to database
            fs = FileSystemStorage()
            if 'Profile_picture' in request.FILES:
                profile_picture_file = request.FILES['Profile_picture']
                ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                Pro_pic = '/clinic' + fs.url(ppf_name)
                usr.update(Profile_picture=Pro_pic)
            if 'SSN_Picture' in request.FILES:
                ssn_picture_file = request.FILES['SSN_Picture']
                spf_name = fs.save(ssn_picture_file.name, ssn_picture_file)
                SSN_Pic = '/clinic' + fs.url(spf_name)
                usr.update(SSN_Picture=SSN_Pic)
            usr.update(first_name=request.POST['first_name'])
            usr.update(middle_name=request.POST['middle_name'])
            usr.update(last_name=request.POST['last_name'])
            usr.update(country=request.POST['country'])
            usr.update(state=request.POST['state'])
            usr.update(city=request.POST['city'])
            usr.update(street=request.POST['street'])
            usr.update(zip_code=request.POST['zip_code'])
            usr.update(phone_number=request.POST['phone_number'])
            usr.update(home_phone_number=request.POST['home_phone_number'])
            usr.update(work_phone_number=request.POST['work_phone_number'])
            usr.update(Date_of_birth=request.POST['Date_of_birth'])
            usr.update(Child_num=request.POST['Child_num'])
            usr.update(email_1=request.POST['email_1'])
            usr.update(email_2=request.POST['email_2'])
            usr.update(Nationality=request.POST['Nationality'])
            usr.update(Jop_place=request.POST['Jop_place'])
            usr.update(Job_name=request.POST['Job_name'])
            usr.update(Job_organization=request.POST['Job_organization'])
            usr.update(Ssn=request.POST['Ssn'])
            ssn = request.POST['Ssn']
            ssn_id = ssn[7:14]
            usr.update(Ssn_id=ssn_id)
            genderMessage = gender(request.POST['gender'])
            maritalStatusMessage = maritalStatus(request.POST['marital_status'])
            if genderMessage == 'error':
                return HttpResponseRedirect('/clinic/updateClinicDoctor/')
            elif maritalStatusMessage == 'error':
                return HttpResponseRedirect('/clinic/updateClinicDoctor/')
            else:
                usr.update(gender=genderMessage)
                usr.update(marital_status=maritalStatusMessage)
            usr.update(User_type=2)
            #########################################################
            # form 2
            doct = doctor.objects.filter(Doc_id=Docid)
            doct.update(Registration_num=request.POST['Registration_num'])
            doct.update(Specialization=request.POST['Specialization'])
            doct.update(Registration_date=request.POST['Registration_date'])
            doct.update(licence=request.POST['licence'])
            doct.update(Last_date_payment=request.POST['Last_date_payment'])
            doct.update(End_date=request.POST['End_date'])
            doct.update(Specialization_type=request.POST['Specialization_type'])
            doct.update(University=request.POST['University'])
            doct.update(Work_place=request.POST['Work_place'])
            doct.update(Sub_syndicate=request.POST['Sub_syndicate'])
            doct.update(General_secretary=request.POST['General_secretary'])
            doct.update(Working_till=request.POST['Working_till'])
            doct.update(Graduation_year=request.POST['Graduation_year'])
            ########################################################
            return HttpResponseRedirect('/clinic/Index/')
        else:
            clinicdata = organization.objects.get(org_id=request.session['clinic_id'])
            doctorData = doctor.objects.get(Doc_id=Docid)
            userData = user.objects.get(user_id=Docid)
            context = {
                'clinic': clinicdata,
                'clin_id': clinicdata.org_id,
                'doctorData': doctorData,
                'userData': userData,
            }
            return render(request, 'updateClinicDoctor.html', context)
    else:
        return HttpResponseRedirect('/clinic/')


# patient doctor functions
def add_doctor(request):
    if 'clinic_id' in request.session:
        if request.method == 'POST':
            formu = AddUser(request.POST or None)
            if formu.is_valid():
                # stop save in database
                instance1 = formu.save(commit=False)
                password = formu.cleaned_data.get('New_Password')
                con_password = formu.cleaned_data.get('Confirm_Pass')
                if not check_password(con_password, password):
                    return HttpResponseRedirect('/AddClinicDoctor/?c=1')
                else:
                    # upload profile,ssn pictures and save paths to database
                    profile_picture_file = request.FILES['Profile_picture']
                    ssn_picture_file = request.FILES['SSN_Picture']
                    fs = FileSystemStorage()
                    ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                    spf_name = fs.save(ssn_picture_file.name, ssn_picture_file)
                    instance1.Profile_picture = '/clinic' + fs.url(ppf_name)
                    instance1.SSN_Picture = '/clinic' + fs.url(spf_name)
                    # extract ssn id from full ssn
                    ssn = instance1.Ssn
                    instance1.Ssn_id = ssn[7:14]
                    genderMessage = gender(request.POST['gender'])
                    maritalStatusMessage = maritalStatus(request.POST['marital_status'])
                    if genderMessage == 'error':
                        return HttpResponseRedirect('/clinic/AddClinicDoctor/')
                    elif maritalStatusMessage == 'error':
                        return HttpResponseRedirect('/clinic/AddClinicDoctor/')
                    else:
                        instance1.gender = genderMessage
                        instance1.marital_status = maritalStatusMessage
                    instance1.User_type = 2
                    instance1.save()
                    # get the user id with the email
                    ef = formu.cleaned_data.get('email_1')
                    u_id = user.objects.get(email_1=ef).user_id
                    # form 2
                    doc = doctor()
                    doc.Doc_id = u_id
                    doc.Registration_num = request.POST['Registration_num']
                    doc.Specialization = request.POST['Specialization']
                    doc.Registration_date = request.POST['Registration_date']
                    doc.licence = request.POST['licence']
                    doc.Last_date_payment = request.POST['Last_date_payment']
                    doc.End_date = request.POST['End_date']
                    doc.Specialization_type = request.POST['Specialization_type']
                    doc.University = request.POST['University']
                    doc.Work_place = request.POST['Work_place']
                    doc.Sub_syndicate = request.POST['Sub_syndicate']
                    doc.General_secretary = request.POST['General_secretary']
                    doc.Working_till = request.POST['Working_till']
                    doc.Graduation_year = request.POST['Graduation_year']
                    doc.hospital_id = request.session['hospital_id']
                    doc.save()
                    return HttpResponseRedirect('/clinic/Index/')
            else:
                print('form one')
                print(formu.errors)
        else:
            clinicdata = organization.objects.get(org_id=request.session['clinic_id']);
            form1 = AddUser()
            B_Doctor = doctor.objects.filter(clinic_id__isnull=True)
            context = {
                'clinic': clinicdata,
                'clin_id': clinicdata.org_id,
                'form1': form1,
                'b_d': B_Doctor,
            }
            return render(request, 'addClinicDoctor.html', context)
    else:
        return HttpResponseRedirect('/clinic/')


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


# end of doctor profile

def delete_doctor(request, Did):
    if 'clinic_id' in request.session:
        doctor.objects.filter(Doc_id=Did).update(clinic_id='')
        return HttpResponseRedirect('/clinic/Index/')
    else:
        return HttpResponseRedirect('/clinic/')


def unblock_doctor(request, ssn):
    if 'clinic_id' in request.session:
        docId = user.objects.get(Ssn=ssn).user_id
        clinId = request.session['clinic_id']
        doctor.objects.filter(Doc_id=docId).update(clinic_id=clinId)
        return HttpResponseRedirect('/clinic/Index/')
    else:
        return HttpResponseRedirect('/clinic/')


def clinic_profile_view(request, clinid=None):
    if 'clinic_id' in request.session or 'patient_id' in request.session:
        clinicdata = get_object_or_404(organization, org_id=clinid)
        context = {
            'clinic': clinicdata,
            'clin_id': clinicdata.org_id,
        }
        if 'clinic_id' not in request.session and 'patient_id' not in request.session:
            return HttpResponseRedirect('/clinic/')
        return render(request, 'clinicProfileView.html', context)
    else:
        return HttpResponseRedirect('/clinic/')


def reset_doc_passowrd(request, id):
    if 'clinic_id' in request.session:
        user.objects.filter(user_id=id).update(New_Password='123456789')
        return HttpResponseRedirect('/clinic/Index/')
    else:
        return HttpResponseRedirect('/clinic/')

# class StatView(View):
#     def get(self, request, *args, **kwargs):
#
#         context = {'hos_id' : request.session['hospital_id']}
#         return render(request, 'hospital_charts.html', context)
#
# class HospitalStatistics(APIView):
#     authentication_classes = []
#     permission_classes = []
#
#     def get(self,request,format=None):
#         labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']
#         defulatdata_items = [12500,10000,15500,11151,12115,13891]
#         data1 = {
#         "label":labels,
#         "default":defulatdata_items,
#         }
#         data2 = {
#         "label":['Rd', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
#         "default":defulatdata_items,
#         }
#         data3 = {
#         "label":labels,
#         "default":defulatdata_items,
#         }
#         data = {
#         "data1":data1,
#         "data2":data2,
#         "data3":data3,
#         }
#         return Response(data)