from django.contrib.auth.decorators import login_required
from django.http import request, HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.template import context
from django.views import generic

from hospital.models import organization
from patient.models import patient, user
from doctor.models import report, all_medicine, prescription, patient_medicine
from patient.forms import patientLoginToPharmacyForm

# Create your views here.

# def patientLoginToPharmacy(scanedId):
#     pharmacyPatient = user.objects.get(Ssn_id__exact=scanedId)
#     if pharmacyPatient :
#         return pharmacyPatient
#     else:
#         return False



def pharmacyLogin(request):
    if request.method == 'POST':
        pharmacyName = request.POST['pharm_name']
        pharmacyPass = request.POST['pharm_pass']
        pharmacyUserFound = organization.objects.filter(hr_username__exact=pharmacyName).exists()
        pharmacyPassFound = organization.objects.filter(hr_password__exact=pharmacyPass).exists()
        if pharmacyUserFound:
            if pharmacyPassFound:
                organ_id = organization.objects.get(hr_username=pharmacyName).org_id
                request.session['org_id'] = organ_id
                return HttpResponseRedirect('pharmacyPatientLogin/')
            else:
                print('wrong pass')
                return HttpResponse("You entered wrong pass")
        else:
            print('phar not exist')
            return HttpResponseNotFound('<h1>Pharmacy not found</h1>')
    else:
        return render(request,'pharmacyLogin.html',{})




def pharmacyPatientLogin(request):
    if request.method == 'POST':
        ssn_id = request.POST['pat_id']
        u_id = user.objects.get(Ssn_id=ssn_id).user_id
        request.session['patient_id'] = u_id
        return HttpResponseRedirect('medicines/')
    else:
        return render(request,'pharmacyIndex.html',{})



# def pharmacy(request):
#     if request.method == 'POST':
#         form = patientLoginToPharmacyForm(request.POST or None)
#         if form.is_valid():
#
#             request.session['patientData']=4
#             request.session['pharmacyId']=1
#             return HttpResponseRedirect('pharmacy/medicines/')
#     else:
#         form = patientLoginToPharmacyForm()
#     context={ 'form' : form }
#     return render(request, 'pharmacy.html', context)

# class medicineListView(generic.ListView):
#     model = patient_medicine
#     print(all_medicine.medicine_id[1])
#     # print(patient_medicine.med.medicine_name)
#     context_object_name = 'medicine_list'
#     template_name = 'pharmacy/patientMedicineToBeSubmit.html'
#
#     def get_queryset(self):
#         patientFound = patient_medicine.objects.filter(pat_id__exact='4').exists()
#         if patientFound:
#             if patient_medicine.objects.filter(pharmacy__isnull=True).exists():
#                 return patient_medicine.objects.filter(pharmacy__isnull=True)
#             else:
#                 return HttpResponse("You don't have any medicines")
#         else:
#             HttpResponseNotFound('<h1>patient not found</h1>')


def medicineListView(request):
    patient_id= request.session['patient_id']
    pharmacy_id = request.session['org_id']
    patientFoundTrueAndFalse = patient_medicine.objects.filter(pat_id__exact=patient_id).exists()
    if patientFoundTrueAndFalse:
        medicineFound = patient_medicine.objects.filter(pharmacy__isnull=True).exists()
        if medicineFound:
            medicineData = patient_medicine.objects.filter(pharmacy__isnull=True)
            if request.method == 'POST':
                medicineInsert = patient_medicine(P_M_id=request.POST['med_id'])
                medicineInsert.pharmacy_id = pharmacy_id
                medicineInsert.pat_id = patient_id
                medicineInsert.med_id = request.POST['id_of_med']
                medicineInsert.number_of_pills = request.POST['num_of_pot']
                medicineInsert.number_of_potions = request.POST['num_of_pil']
                medicineInsert.save()
            else:
                print('error')
            context = {
                'DataNotSubmitted': medicineData,
                'ph_id': pharmacy_id,
            }
            return render(request, 'patientMedicineToBeSubmit.html', context)

        else:
            return HttpResponse("You don't have any medicines")
    else:
            HttpResponseNotFound('<h1>patient not found</h1>')



# def medicineListView(request):
#     patient_id = request.session['patient_id']
#     pharmacy_id = request.session['org_id']
#


