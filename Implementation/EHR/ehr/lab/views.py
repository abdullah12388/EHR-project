from django.http import HttpResponseRedirect, HttpResponse, HttpResponseNotFound
from django.shortcuts import render

# Create your views here.
from hospital.models import organization
from patient.models import user


def lab(request):
    return render(request, 'test.html', {})

def labLogin(request):
    if request.method == 'POST':
        labName = request.POST['lab_name']
        labPass = request.POST['lab_pass']
        labUserFound = organization.objects.filter(hr_username__exact=labName).exists()
        labPassFound = organization.objects.filter(hr_password__exact=labPass).exists()
        if labUserFound:
            if labPassFound:
                organ_id = organization.objects.get(hr_username=labName).org_id
                request.session['org_id'] = organ_id
                return HttpResponseRedirect('labPatientLogin/')
            else:
                print('wrong pass')
                return HttpResponse("You entered wrong pass")
        else:
            print('lab not exist')
            return HttpResponseNotFound('<h1>Lab not found</h1>')
    else:
        return render(request,'labLogin.html',{})


def labPatientLogin(request):
    if request.method == 'POST':
        ssn_id = request.POST['pat_id']
        u_id = user.objects.get(Ssn_id=ssn_id).user_id
        request.session['patient_id'] = u_id
        return HttpResponseRedirect('analyticsAndRays/')
    else:
        return render(request,'labIndex.html',{})


