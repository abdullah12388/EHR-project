from django.core.files.storage import FileSystemStorage
from hospital.models import organization,hospital
from django.http import HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.http import HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.shortcuts import render, redirect,get_object_or_404
from doctor.models import patient_analytics, patient_rays
from hospital.models import organization
from patient.views import QRCodeScanner
from patient.models import patient, user

globalVariableForScanningQRCode = ''
data = ""
def labLogin(request):
    if request.method == 'POST':
        labName = request.POST['lab_name']
        labPass = request.POST['lab_pass']
        labUserFound = organization.objects.filter(hr_username__exact=labName).exists()
        labPassFound = organization.objects.filter(hr_password__exact=labPass).exists()
        if labUserFound:
            if labPassFound:
                organ_id = organization.objects.filter(Type=2).filter(hr_password=labPass).get(hr_username=labName).org_id
                request.session['lab_id'] = organ_id
                request.session['type'] = 'lab'
                return HttpResponseRedirect('labPatientLogin/')
            else:
                print('wrong password')
                return HttpResponse("You entered wrong pass")
        else:
            print('Lab not exists')
            return HttpResponseNotFound('<h1>Lab not found</h1>')
    else:
        request.session['type'] = 'lab'
        return render(request,'labLogin.html',{})


def labLogout(request):
    if request.session['type'] == 'lab':
        if 'lab_id' in request.session:
            request.session.pop('lab_id')
            print('SESSION FOUND')
        if 'lab_id' not in request.session:
            print('SESSION DELETED')
    else:
        print('there is no lab entered')
    return HttpResponseRedirect('/lab/')


def labPatientLogin(request ):
    if request.method == 'POST':

        ssn_id = request.POST['pat_id']
        u_id = user.objects.get(Ssn_id=ssn_id).user_id
        request.session['patie_id'] = u_id
        if request.POST['type'] == '1':
            print('we did it')
            return HttpResponseRedirect('Analytics/')
        elif request.POST['type'] == '2':
            print('rays')
            return HttpResponseRedirect('Rays/')
        else:
            print('Please Choose right type')
    else:
        if 'ssnid' not in request.session:
            return render(request,'labIndex.html',{'lab_id':request.session['lab_id']})
        else:
            return render(request, 'labIndex.html', {'lab_id':request.session['lab_id'],'SSN_ID': request.session['ssnid'],})

def QRCodeScanView(request):
    QRData = QRCodeScanner()
    QRData = QRData.decode("UTF-8")
    request.session['ssnid'] = QRData
    return HttpResponseRedirect('/lab/labPatientLogin/')



def AnalyticsListView(request):
    # patient_id = request.session['patient_id']
    #This will delete the SSN ID after loggin by the patient
    if 'ssnid' in request.session:
        request.session.pop('ssnid')
    patient_id = patient.objects.get(Patient_id=request.session['patie_id']).id
    lab_id = request.session['lab_id']
    patientFoundTrueAndFalse = patient_analytics.objects.filter(pat_id__exact=patient_id).exists()
    if patientFoundTrueAndFalse:
        analyticsFound = patient_analytics.objects.filter(lab__isnull=True).exists()
        if analyticsFound:
            analyticsData = patient_analytics.objects.filter(lab__isnull=True)
            if request.method == 'POST':
                analyticsInsert = patient_analytics(P_A_id=request.POST['ana_id'])
                analyticsInsert.lab_id = lab_id
                analyticsInsert.pat_id = patient_id
                analyticsInsert.analy_id = request.POST['analy_id']
                analyticsResult = request.FILES['analytics_result']
                fs = FileSystemStorage()
                analyResult = fs.save(analyticsResult.name, analyticsResult)
                analyticsInsert.analytics_result = '/lab' + fs.url(analyResult)
                analyticsInsert.save()
            else:
                print('error')
            context = {
                'AnalyticsNotSubmitted': analyticsData,
                'lab_id': lab_id,
            }
            return render(request, 'patientAnalyticsToBeSubmit.html', context)
        else:
            return HttpResponse("You don't have any analytics")
    else:
            return HttpResponseNotFound('<h1>patient not found</h1>')


def RaysListView(request):
    # patient_id = request.session['patient_id']
    # This will delete the SSN ID after loggin by the patient
    if 'ssnid' in request.session:
        request.session.pop('ssnid')
    patient_id = patient.objects.get(Patient_id=request.session['patie_id']).id
    lab_id = request.session['lab_id']
    patientFoundTrueAndFalse = patient_rays.objects.filter(pat_id__exact=patient_id).exists()
    if patientFoundTrueAndFalse:
        RaysFound = patient_rays.objects.filter(lab__isnull=True).exists()
        if RaysFound:
            RaysData = patient_rays.objects.filter(lab__isnull=True)
            if request.method == 'POST':
                RaysInsert = patient_rays(P_R_id=request.POST['ray_id'])
                RaysInsert.lab_id = lab_id
                RaysInsert.pat_id = patient_id
                RaysInsert.ray_id = request.POST['rays_id']
                RaysResult = request.FILES['rays_result']
                fs = FileSystemStorage()
                rayResult = fs.save(RaysResult.name, RaysResult)
                RaysInsert.rays_result = '/lab' + fs.url(rayResult)
                RaysInsert.save()
            else:
                print('error')
            context = {
                'RaysNotSubmitted': RaysData,
                'lab_id': lab_id,
            }
            return render(request, 'patientRaysToBeSubmit.html', context)
        else:
            return HttpResponse("You don't have any Rays")
    else:
        return HttpResponseNotFound('<h1>patient not found</h1>')


# def lab_profile_view(request,labid,hosid):
#     # pharmacyData = organization.objects.filter(Type=1).get(org_id=request.session['pharmacy_id'])
#     labData = organization.objects.filter(Type=2).get(org_id=labid)
#     hospitaldata = hospital.objects.get(h_id=hosid)
#     context ={
#         'lab': labData,
#         'lab_id':labData.org_id,
#         'hospital':hospitaldata,
#     }
#     return render(request, 'labProfileView.html',context)

# def lab_profile_view(request):
#     id = request.session['lab_id']
#     labData = organization.objects.filter(Type=2).get(org_id=id)
#     context ={
#         'lab': labData,
#         'lab_id':labData.org_id,
#     }
#     return render(request, 'labProfileView.html',context)

def lab_profile_view(request,labid=None):
    labData = get_object_or_404(organization,org_id=labid)
    context ={
        'lab': labData,
        'lab_id':labData.org_id,
    }
    return render(request, 'labProfileView.html',context)