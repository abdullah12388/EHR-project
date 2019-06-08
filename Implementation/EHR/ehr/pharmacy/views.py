from django.contrib.auth.decorators import login_required
from django.http import request, HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.template import context
from django.views import generic
from hospital.models import organization,hospital
from patient.models import patient, user, AllNotification
from doctor.models import report, all_medicine, prescription, patient_medicine
from patient.forms import patientLoginToPharmacyForm
from patient.views import QRCodeScanner



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
        return HttpResponseRedirect('medicines/')
    else:
        if 'ssnID' not in request.session:
            return render(request, 'pharmacyIndex.html', {'ph_id':request.session['pharmacy_id']})
        else:
            return render(request, 'pharmacyIndex.html', {'ph_id':request.session['pharmacy_id'],'SSNID': request.session['ssnID']})


def QRCodeScanView(request):
    QRData = QRCodeScanner()
    QRData = QRData.decode("UTF-8")
    request.session['ssnID'] = QRData
    return HttpResponseRedirect('/pharmacy/pharmacyPatientLogin/')

def medicineListView(request):
    pharmacy_id = request.session['pharmacy_id']
    if 'ssnID' in request.session:
        request.session.pop('ssnID')
    # user_id = request.session['patient_id']
    # print(user_id)
    if 'pharmacy_id' in request.session and 'patien_id' in request.session:
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
                    ##################### khan added from here to make notifications available ##################
                    # creating instance from table "AllNotification" to affect and get notification from it
                    notificationToBeSentToPatientFromPharmacy = AllNotification()
                    # taking ID from session of the doctor and patient I did't use what omar did because i need user instance
                    pharmacyIdInSession = request.session['pharmacy_id']
                    patientIdInSession = request.session['patien_id']
                    pharmacyId = organization.objects.get(org_id=pharmacyIdInSession)
                    patientId = user.objects.get(user_id=patientIdInSession)
                    # affecting table "AllNotification" and save data to preview to the user
                    notificationToBeSentToPatientFromPharmacy.pharmacySenderId = pharmacyId
                    notificationToBeSentToPatientFromPharmacy.patientRecipient = patientId
                    notificationToBeSentToPatientFromPharmacy.message = 'pharmacy ' + pharmacyId.org_name + ' gave you a medicine'
                    notificationToBeSentToPatientFromPharmacy.save()
                    #############################################################################################
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
    else:
        return HttpResponseRedirect('pharmacy/')

# def pharmacy_profile_view(request,pharid,hosid):
#     # pharmacyData = organization.objects.filter(Type=1).get(org_id=request.session['pharmacy_id'])
#     pharmacyData = organization.objects.filter(Type=1).get(org_id=pharid)
#     hospitaldata = hospital.objects.get(h_id=hosid)
#     context ={
#         'pharmacy': pharmacyData,
#         'ph_id':pharmacyData.org_id,
#         'hospital':hospitaldata,
#     }
#     return render(request, 'pharmacyProfileView.html',context)

# def pharmacy_profile_view(request):
#     id = request.session['pharmacy_id']
#     pharmacyData = organization.objects.filter(Type=1).get(org_id=id)
#     context ={
#         'pharmacy': pharmacyData,
#         'ph_id':pharmacyData.org_id,
#     }
#     return render(request, 'pharmacyProfileView.html',context)

def pharmacy_profile_view(request,pharid=None):
    pharmacyData = get_object_or_404(organization,org_id=pharid)
    context ={
        'pharmacy': pharmacyData,
        'ph_id':pharmacyData.org_id,
        'hos_id':None,
    }
    return render(request, 'pharmacyProfileView.html',context)