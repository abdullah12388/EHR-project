from django.contrib.auth.hashers import check_password
from django.contrib.auth.hashers import make_password
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotFound
from django.shortcuts import render, get_object_or_404
from django.views.generic import View
from rest_framework.response import Response
from rest_framework.views import APIView

from doctor.models import doctor
from patient.forms import AddUser
from patient.models import user
from .models import hospital, organization


# Create your views here.


def hospitalLogin(request):
    if request.method == 'POST':
        hospitalName = request.POST['hospital_name']
        hospitalPass = request.POST['hospital_pass']
        hospitalUserFound = hospital.objects.filter(hr_username__exact=hospitalName).exists()
        hospitalPassFound = hospital.objects.filter(hr_password__exact=hospitalPass).exists()
        if hospitalUserFound:
            if hospitalPassFound:
                hos_id = hospital.objects.get(hr_username=hospitalName).h_id
                request.session['hospital_id'] = hos_id
                request.session['type'] = 'hospital'
                return HttpResponseRedirect('Index/')
            else:
                print('wrong password')
                return HttpResponse("You entered wrong pass")
        else:
            print('hospital not exists')
            return HttpResponseNotFound('<h1>Hospital not found</h1>')
    else:
        request.session['type'] = 'hospital'
        return render(request, 'hospitalLogin.html', {})


def hospitalLogout(request):
    if request.session['type'] == 'hospital':
        if 'hospital_id' in request.session:
            request.session.pop('hospital_id')
            print('SESSION FOUND')
        if 'hospital_id' not in request.session:
            print('SESSION DELETED')
    else:
        print('there is no hospital entered')
    return HttpResponseRedirect('/hospital/')


def Index(request):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            depart_num = request.POST['departments']
            bed_num = request.POST['bed_num']
            if depart_num == '1':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.internal_medicine = e.internal_medicine + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '2':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.cardiology = e.cardiology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '3':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.endocrinology = e.endocrinology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '4':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.hematology = e.hematology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '5':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.nephrology = e.nephrology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '6':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.surgery = e.surgery + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '7':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.pediatric = e.pediatric + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '8':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.obstertics_genacology = e.obstertics_genacology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '9':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.ophthalmologist = e.ophthalmologist + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '10':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.neurology = e.neurology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '11':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.Ear_nose_threat = e.Ear_nose_threat + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '12':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.urology = e.urology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '13':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.dermatology = e.dermatology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '14':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.hepatology = e.hepatology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '15':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.Radiology = e.Radiology + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '16':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.psychiatry = e.psychiatry + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '17':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.dentistry = e.dentistry + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            elif depart_num == '18':
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.forensic_medicine = e.forensic_medicine + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
            else:
                e = hospital.objects.get(h_id=request.session['hospital_id'])
                e.enatony = e.enatony + int(bed_num)
                e.num_of_bed = e.num_of_bed + int(bed_num)
                e.save()
        else:
            print('no post yet')
        hospitaldata = hospital.objects.get(h_id=request.session['hospital_id'])
        doctordata = doctor.objects.filter(hospital_id=request.session['hospital_id'])
        pharmacydata = organization.objects.filter(Type=1).filter(hospital_id=request.session['hospital_id'])
        labdata = organization.objects.filter(Type=2).filter(hospital_id=request.session['hospital_id'])
        context = {
            'hospital': hospitaldata,
            'hos_id': hospitaldata.h_id,
            'doctor': doctordata,
            'pharmacy': pharmacydata,
            'lab': labdata,
        }
        return render(request, 'hospitalIndex.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


def update_doctor(request, Docid):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            usr = user.objects.filter(user_id=Docid)
            # upload profile,ssn pictures and save paths to database
            fs = FileSystemStorage()
            if 'Profile_picture' in request.FILES:
                profile_picture_file = request.FILES['Profile_picture']
                ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                Pro_pic = '/hospital' + fs.url(ppf_name)
                usr.update(Profile_picture=Pro_pic)
            if 'SSN_Picture' in request.FILES:
                ssn_picture_file = request.FILES['SSN_Picture']
                spf_name = fs.save(ssn_picture_file.name, ssn_picture_file)
                SSN_Pic = '/hospital' + fs.url(spf_name)
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
                return HttpResponseRedirect('/hospital/updateHospitalDoctor/')
            elif maritalStatusMessage == 'error':
                return HttpResponseRedirect('/hospital/updateHospitalDoctor/')
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
            return HttpResponseRedirect('/hospital/Index/')
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id'])
            doctorData = doctor.objects.get(Doc_id=Docid)
            userData = user.objects.get(user_id=Docid)
            context = {
                'hospital': hospitaldata,
                'hos_id': hospitaldata.h_id,
                'doctorData': doctorData,
                'userData': userData,
            }
            return render(request, 'updateHospitalDoctor.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


# patient doctor functions
def add_doctor(request):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            formu = AddUser(request.POST or None)
            if formu.is_valid():
                # stop save in database
                instance1 = formu.save(commit=False)
                password = formu.cleaned_data.get('New_Password')
                con_password = formu.cleaned_data.get('Confirm_Pass')
                if not check_password(con_password, password):
                    return HttpResponseRedirect('/AddHospitalDoctor/?c=1')
                else:
                    # upload profile,ssn pictures and save paths to database
                    profile_picture_file = request.FILES['Profile_picture']
                    ssn_picture_file = request.FILES['SSN_Picture']
                    fs = FileSystemStorage()
                    ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                    spf_name = fs.save(ssn_picture_file.name, ssn_picture_file)
                    instance1.Profile_picture = '/hospital' + fs.url(ppf_name)
                    instance1.SSN_Picture = '/hospital' + fs.url(spf_name)
                    # extract ssn id from full ssn
                    ssn = instance1.Ssn
                    instance1.Ssn_id = ssn[7:14]
                    genderMessage = gender(request.POST['gender'])
                    maritalStatusMessage = maritalStatus(request.POST['marital_status'])
                    if genderMessage == 'error':
                        return HttpResponseRedirect('/hospital/AddHospitalDoctor/')
                    elif maritalStatusMessage == 'error':
                        return HttpResponseRedirect('/hospital/AddHospitalDoctor/')
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
                    return HttpResponseRedirect('/hospital/Index/')
            else:
                print('form one')
                print(formu.errors)
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id'])
            form1 = AddUser()
            B_Doctor = doctor.objects.filter(hospital_id__isnull=True)
            context = {
                'hospital': hospitaldata,
                'hos_id': hospitaldata.h_id,
                'form1': form1,
                'b_d': B_Doctor,
            }
            return render(request, 'addHospitalDoctor.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


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
def update_pharmacy(request, pharid, hosid):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            phr = organization.objects.filter(Type=1).filter(hospital_id=hosid).filter(org_id=pharid)
            # upload profile,ssn pictures and save paths to database
            fs = FileSystemStorage()
            if 'org_logo' in request.FILES:
                profile_picture_file = request.FILES['org_logo']
                ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                or_log = '/hospital' + fs.url(ppf_name)
                phr.update(org_logo=or_log)
            phr.update(org_name=request.POST['org_name'])
            phr.update(org_website=request.POST['org_website'])
            phr.update(org_country=request.POST['org_country'])
            phr.update(org_state=request.POST['org_state'])
            phr.update(org_city=request.POST['org_city'])
            phr.update(org_zipcode=request.POST['org_zipcode'])
            phr.update(org_phone_num=request.POST['org_phone_num'])
            phr.update(org_email=request.POST['org_email'])
            phr.update(hr_username=request.POST['hr_username'])
            phr.update(hr_password=request.POST['hr_password'])
            return HttpResponseRedirect('/hospital/Index/')
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id']);
            pharmacyData = organization.objects.filter(Type=1).filter(hospital_id=hosid).get(org_id=pharid)
            context = {
                'hospital': hospitaldata,
                'hos_id': hospitaldata.h_id,
                'pharmacyData': pharmacyData,
            }
            return render(request, 'updatePharmacy.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


def add_pharmacy(request):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            # upload profile,ssn pictures and save paths to database
            pharmacy = organization()
            profile_picture_file = request.FILES['org_logo']
            fs = FileSystemStorage()
            ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
            pharmacy.org_logo = '/hospital' + fs.url(ppf_name)
            pharmacy.org_name = request.POST['org_name']
            pharmacy.org_country = request.POST['org_country']
            pharmacy.org_state = request.POST['org_state']
            pharmacy.org_city = request.POST['org_city']
            pharmacy.org_zipcode = request.POST['org_zipcode']
            pharmacy.org_phone_num = request.POST['org_phone_num']
            pharmacy.org_email = request.POST['org_email']
            pharmacy.org_website = request.POST['org_website']
            pharmacy.hr_username = request.POST['hr_username']
            pharmacy.hr_password = request.POST['hr_password']
            pharmacy.Type = 1
            pharmacy.hospital_id = request.session['hospital_id']
            pharmacy.save()
            return HttpResponseRedirect('/hospital/Index/')
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id']);
            return render(request, 'addPharmacy.html', {'hospital': hospitaldata, 'hos_id': hospitaldata.h_id, })
    else:
        return HttpResponseRedirect('/hospital/')


def update_lab(request, labid, hosid):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            labor = organization.objects.filter(Type=2).filter(hospital_id=hosid).filter(org_id=labid)
            # upload profile,ssn pictures and save paths to database
            fs = FileSystemStorage()
            if 'org_logo' in request.FILES:
                profile_picture_file = request.FILES['org_logo']
                ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
                or_log = '/hospital' + fs.url(ppf_name)
                labor.update(org_logo=or_log)
            labor.update(org_name=request.POST['org_name'])
            labor.update(org_website=request.POST['org_website'])
            labor.update(org_country=request.POST['org_country'])
            labor.update(org_state=request.POST['org_state'])
            labor.update(org_city=request.POST['org_city'])
            labor.update(org_zipcode=request.POST['org_zipcode'])
            labor.update(org_phone_num=request.POST['org_phone_num'])
            labor.update(org_email=request.POST['org_email'])
            labor.update(hr_username=request.POST['hr_username'])
            labor.update(hr_password=request.POST['hr_password'])
            return HttpResponseRedirect('/hospital/Index/')
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id']);
            labData = organization.objects.filter(Type=2).filter(hospital_id=hosid).get(org_id=labid)
            print(labData.org_name)
            context = {
                'hospital': hospitaldata,
                'hos_id': hospitaldata.h_id,
                'labData': labData,
            }
            return render(request, 'updateLab.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


def add_Lab(request):
    if 'hospital_id' in request.session:
        if request.method == 'POST':
            # upload profile,ssn pictures and save paths to database
            pharmacy = organization()
            profile_picture_file = request.FILES['org_logo']
            fs = FileSystemStorage()
            ppf_name = fs.save(profile_picture_file.name, profile_picture_file)
            pharmacy.org_logo = '/hospital' + fs.url(ppf_name)
            pharmacy.org_name = request.POST['org_name']
            pharmacy.org_country = request.POST['org_country']
            pharmacy.org_state = request.POST['org_state']
            pharmacy.org_city = request.POST['org_city']
            pharmacy.org_zipcode = request.POST['org_zipcode']
            pharmacy.org_phone_num = request.POST['org_phone_num']
            pharmacy.org_email = request.POST['org_email']
            pharmacy.org_website = request.POST['org_website']
            pharmacy.hr_username = request.POST['hr_username']
            pharmacy.hr_password = request.POST['hr_password']
            pharmacy.Type = 2
            pharmacy.hospital_id = request.session['hospital_id']
            pharmacy.save()
            return HttpResponseRedirect('/hospital/Index/')
        else:
            hospitaldata = hospital.objects.get(h_id=request.session['hospital_id']);
            return render(request, 'addLab.html', {'hospital': hospitaldata, 'hos_id': hospitaldata.h_id, })
    else:
        return HttpResponseRedirect('/hospital/')


def delete_doctor(request, Did):
    if 'hospital_id' in request.session:
        doctor.objects.filter(Doc_id=Did).update(hospital_id='')
        return HttpResponseRedirect('/hospital/Index/')
    else:
        return HttpResponseRedirect('/hospital/')


def delete_pharmacy_lab(request, ph_lb_id, ph_lb_type):
    if 'hospital_id' in request.session:
        # organization.objects.filter(org_id=ph_lb_id).filter(Type=ph_lb_type).update(hospital_id='')
        organization.objects.filter(org_id=ph_lb_id).filter(Type=ph_lb_type).delete()
        return HttpResponseRedirect('/hospital/Index/')
    else:
        return HttpResponseRedirect('/hospital/')


def unblock_doctor(request, ssn):
    if 'hospital_id' in request.session:
        docId = user.objects.get(Ssn=ssn).user_id
        hosId = request.session['hospital_id']
        doctor.objects.filter(Doc_id=docId).update(hospital_id=hosId)
        return HttpResponseRedirect('/hospital/Index/')
    else:
        return HttpResponseRedirect('/hospital/')


def hospital_profile_view(request, hosid=None):
    if 'hospital_id' in request.session:
        hospitaldata = get_object_or_404(hospital, h_id=hosid)
        context = {
            'hospital': hospitaldata,
            'hos_id': hospitaldata.h_id,
        }
        if 'patient_id' not in request.session and 'hospital_id' not in request.session:
            return HttpResponseRedirect('/hospital/')
        return render(request, 'hospitalProfileView.html', context)
    else:
        return HttpResponseRedirect('/hospital/')


def reset_doc_passowrd(request, id):
    if 'hospital_id' in request.session:
        password = make_password('123456789')
        print("new password", password)
        user.objects.filter(user_id=id).update(New_Password=password)
        return HttpResponseRedirect('/hospital/Index/')
    else:
        return HttpResponseRedirect('/hospital/')


class StatView(View):
    def get(self, request, *args, **kwargs):
        context = {'hos_id': request.session['hospital_id']}
        return render(request, 'hospital_charts.html', context)
#
#
# class HospitalStatistics(APIView):
#     authentication_classes = []
#     permission_classes = []
#
#     def get(self, request, format=None):
#         labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']
#         defulatdata_items = [12500, 10000, 15500, 11151, 12115, 13891]
#         data1 = {
#             "label": labels,
#             "default": defulatdata_items,
#         }
#         data2 = {
#             "label": ['Rd', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
#             "default": defulatdata_items,
#         }
#         data3 = {
#             "label": labels,
#             "default": defulatdata_items,
#         }
#         data = {
#             "data1": data1,
#             "data2": data2,
#             "data3": data3,
#         }
#         return Response(data)
