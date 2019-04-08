from django.contrib.auth.decorators import login_required
from django.http import request, HttpResponseRedirect
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



def pharmacy(request):
    if request.method == 'POST':
        form = patientLoginToPharmacyForm(request.POST or None)
        if form.is_valid():
            id = form.cleaned_data.get('QR_code')
            patientData = get_object_or_404(patient,QR_code= id)
            if patientData:
                for p in patientData.report_set.all():
                    print(p.report)


                return HttpResponseRedirect('/medicines/')

            else:
                print('obaaa')
                return HttpResponseRedirect('login.html')
    else:
        form = patientLoginToPharmacyForm()
        context={ 'form' : form }
    return render(request, 'pharmacy/pharmacy.html', context)

class medicineListView(generic.ListView):
    model = patient_medicine
    context_object_name = 'medicine_list'
    template_name = 'pharmacy/patientMedicineToBeSubmit.html'

    def get_queryset(self):
        return patient_medicine.objects.filter(medicine_submit=False)







