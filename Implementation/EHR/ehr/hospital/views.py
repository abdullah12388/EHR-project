from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotFound
from django.shortcuts import render
from .models import hospital,organization
from doctor.models import doctor
from patient.forms import AddUser
from patient.models import user
from django.contrib.auth.hashers import check_password
from django.core.files.storage import FileSystemStorage
import qrcode, shutil, os
from datetime import date


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
                return HttpResponseRedirect('Index/')
            else:
                print('wrong password')
                return HttpResponse("You entered wrong pass")
        else:
            print('hospital not exists')
            return HttpResponseNotFound('<h1>Hospital not found</h1>')
    else:
        return render(request,'hospitalLogin.html',{})


def Index(request):
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
    hospitaldata = hospital.objects.get(h_id=request.session['hospital_id']);
    doctordata = doctor.objects.filter(hospital_id=request.session['hospital_id']);
    pharmacydata = organization.objects.filter(Type=1).filter(hospital_id=request.session['hospital_id']);
    labdata = organization.objects.filter(Type=2).filter(hospital_id=request.session['hospital_id']);
    context = {
        'hospital': hospitaldata,
        'doctor': doctordata,
        'pharmacy': pharmacydata,
        'lab': labdata,
    }
    return render(request, 'hospitalIndex.html',context)


# patient doctor functions
def add_doctor(request):
    if request.method == 'POST':
        form1 = AddUser(request.POST or None)
        if form1.is_valid():
            # stop save in database
            instance1 = form1.save(commit=False)
            password = form1.cleaned_data.get('New_Password')
            con_password = form1.cleaned_data.get('Confirm_Pass')
            if not check_password(con_password, password):
                return HttpResponseRedirect('/AddDoctor/?c=1')
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
                    return HttpResponseRedirect('/hospital/AddDoctor/')
                elif maritalStatusMessage == 'error':
                    return HttpResponseRedirect('/hospital/AddDoctor/')
                else:
                    instance1.gender = genderMessage
                    instance1.marital_status = maritalStatusMessage
                instance1.User_type = 2
                instance1.save()
                # get the user id with the email
                a = form1.cleaned_data.get('email_1')
                u_id = user.objects.get(email_1=a).user_id
                request.session['user_id'] = u_id
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
            print(form1.errors)
    else:
        form1 = AddUser()
        B_Doctor = doctor.objects.filter(hospital_id__isnull=True)
        print(B_Doctor)
        context = {
            'form1': form1,
            'b_d': B_Doctor,
        }
        return render(request, 'addDoctor.html', context)
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


def add_pharmacy(request):
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
        return render(request, 'addPharmacy.html',{})

def add_Lab(request):
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
        return render(request, 'addLab.html',{})


def delete_doctor(request,Did):
    doctor.objects.filter(Doc_id=Did).update(hospital_id='')
    return HttpResponseRedirect('/hospital/Index/')


def delete_pharmacy_lab(request,ph_lb_id,ph_lb_type):
    # organization.objects.filter(org_id=ph_lb_id).filter(Type=ph_lb_type).update(hospital_id='')
    organization.objects.filter(org_id=ph_lb_id).filter(Type=ph_lb_type).delete()
    return HttpResponseRedirect('/hospital/Index/')

def unblock_doctor(request,ssn):
    print(ssn)
    docId = user.objects.get(Ssn=ssn).user_id
    print(docId)
    hosId = request.session['hospital_id']
    print(hosId)
    doctor.objects.filter(Doc_id=docId).update(hospital_id=hosId)
    return HttpResponseRedirect('/hospital/Index/')














