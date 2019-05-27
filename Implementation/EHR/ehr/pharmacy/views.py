from django.contrib.auth.decorators import login_required
from django.http import request, HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.template import context
from django.views import generic
from hospital.models import organization,hospital
from patient.models import patient, user
from doctor.models import report, all_medicine, prescription, patient_medicine
from patient.forms import patientLoginToPharmacyForm



def pharmacyLogin(request):
    if request.method == 'POST':
        pharmacyName = request.POST['pharm_name']
        pharmacyPass = request.POST['pharm_pass']
        pharmacyUserFound = organization.objects.filter(hr_username__exact=pharmacyName).exists()
        pharmacyPassFound = organization.objects.filter(hr_password__exact=pharmacyPass).exists()
        if pharmacyUserFound:
            if pharmacyPassFound:
                organ_id = organization.objects.filter(Type=1).filter(hr_password=pharmacyPass).get(hr_username=pharmacyName).org_id
                request.session['pharmacy_id'] = organ_id
                request.session['type'] = 'pharmacy'
                return HttpResponseRedirect('pharmacyPatientLogin/')
            else:
                print('wrong pass')
                return HttpResponse("You entered wrong pass")
        else:
            print('phar not exist')
            return HttpResponseNotFound('<h1>Pharmacy not found</h1>')
    else:
        request.session['type'] = 'pharmacy'
        return render(request,'pharmacyLogin.html',{})


def pharmacyLogout(request):
    if request.session['type'] == 'pharmacy':
        if 'pharmacy_id' in request.session:
            request.session.pop('pharmacy_id')
            print('SESSION FOUND')
        if 'pharmacy_id' not in request.session:
            print('SESSION DELETED')
    else:
        print('there is no lab entered')
    return HttpResponseRedirect('/pharmacy/')


def pharmacyPatientLogin(request):
    if request.method == 'POST':
        ssn_id = request.POST['pat_id']
        u_id = user.objects.get(Ssn_id=ssn_id).user_id
        request.session['patien_id'] = u_id
        # print(request.session['patien_id'])
        return HttpResponseRedirect('medicines/')
    else:
        return render(request,'pharmacyIndex.html',{})


def medicineListView(request):
    pharmacy_id = request.session['pharmacy_id']
    # user_id = request.session['patient_id']
    # print(user_id)
    patient_id = patient.objects.get(Patient_id=request.session['patien_id']).id
    # print(patient_id)
    patientFoundTrueAndFalse = patient_medicine.objects.filter(pat_id__exact=patient_id).exists()
    # print(patientFoundTrueAndFalse)
    if patientFoundTrueAndFalse:
        medicineFound = patient_medicine.objects.filter(pharmacy__isnull=True).exists()
        if medicineFound:
            medicineData = patient_medicine.objects.filter(pharmacy__isnull=True)
            if request.method == 'POST':
                medicineInsert = patient_medicine(P_M_id=request.POST['med_id'])
                # print(medicineData)
                medicineInsert.pharmacy_id = pharmacy_id
                medicineInsert.pat_id = patient_id
                medicineInsert.med_id = request.POST['id_of_med']
                medicineInsert.number_of_pills = request.POST['num_of_pot']
                medicineInsert.number_of_potions = request.POST['num_of_pil']
                medicineInsert.save()
            # else:
            #     print('error')
            context = {
                'DataNotSubmitted': medicineData,
                'ph_id': pharmacy_id,
            }
            return render(request, 'patientMedicineToBeSubmit.html', context)

        else:
            return HttpResponse("You don't have any medicines")
    else:
        return HttpResponseNotFound('<h1>patient not found</h1>')

# def pharmacy_profile_view(request):
#     # hospitaldata = hospital.objects.get(h_id=request.session['hospital_id'])
#     pharmacyData = organization.objects.filter(Type=1).filter(hospital_id=hosid).get(org_id=pharid)
#     hospitaldata = hospital.objects.get(h_id=hosid)
#     context ={
#         'hospital': hospitaldata,
#         'pharmacy':pharmacyData,
#     }
#     return render(request, 'pharmacyProfileView.html',context)

def pharmacy_profile_view(request,pharid):
    # pharmacyData = organization.objects.filter(Type=1).get(org_id=request.session['pharmacy_id'])
    pharmacyData = organization.objects.filter(Type=1).get(org_id=pharid)
    context ={
        'pharmacy': pharmacyData,
    }
    return render(request, 'pharmacyProfileView.html',context)