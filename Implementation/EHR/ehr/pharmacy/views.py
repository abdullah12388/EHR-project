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
        print(request.POST['pat_id'])
        request.session['ssn_id'] = request.POST['pat_id']
        ssn_id = request.session['ssn_id']
        user_id = user.objects.filter(Ssn_id=ssn_id)
        print(user_id)
        return HttpResponseRedirect('medicines/')
    else:
        return render(request,'pharmacyIndex.html',{})



def pharmacy(request):
    if request.method == 'POST':
        form = patientLoginToPharmacyForm(request.POST or None)
        if form.is_valid():

            request.session['patientData']=4
            request.session['pharmacyId']=1
            return HttpResponseRedirect('pharmacy/medicines/')
    else:
        form = patientLoginToPharmacyForm()
    context={ 'form' : form }
    return render(request, 'pharmacy.html', context)

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
    session1= request.session['patientData'] = 4
    session2 = request.session['pharmacyId'] = 1
    patientFoundRealData = patient_medicine.objects.filter(pat_id__exact=session1)
    # print(patientFoundRealData)
    patientFoundTrueAndFalse = patient_medicine.objects.filter(pat_id__exact=session1).exists()
    # print(patientFoundTrueAndFalse)
    if patientFoundTrueAndFalse:
        pharmacyFound = patient_medicine.objects.filter(pharmacy__isnull=True).exists()
        if pharmacyFound:
            pharmacyData = patient_medicine.objects.filter(pharmacy__isnull=True)
            context = {
                'DataNotSubmitted': pharmacyData
            }
            print('lsakasdlkaslkamflkmaelkdmlakemdlka')
            return render(request, 'patientMedicineToBeSubmit.html', context)

        else:
            return HttpResponse("You don't have any medicines")
    else:
            HttpResponseNotFound('<h1>patient not found</h1>')
    context = {
        'medicineList': patientFoundRealData,
        'session1':session1,
        'session2': session2,
    }
    return render(request, 'patientMedicineToBeSubmit.html', context)






