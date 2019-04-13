from django.contrib.auth.decorators import login_required
from django.http import request, HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.template import context
from django.views import generic
from django.core.files.storage import FileSystemStorage
from hospital.models import organization
from patient.models import patient, user
from doctor.models import report, all_medicine, prescription, patient_analytics,patient_rays
from patient.forms import patientLoginToPharmacyForm



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
                print('wrong password')
                return HttpResponse("You entered wrong pass")
        else:
            print('Lab not exists')
            return HttpResponseNotFound('<h1>Lab not found</h1>')
    else:
        return render(request,'labLogin.html',{})


# def labLogout(request):
#     if 'org_id' in request.session:
#         request.session.pop('org_id')
#         print('SESSION FOUND')
#     if 'patient_id' in request.session:
#         request.session.pop('patient_id')
#         print('SESSION FOUND')
#     if 'org_id' not in request.session:
#         print('SESSION DELETED')
#     return HttpResponseRedirect('lab/labPatientLogin/')


def labPatientLogin(request):
    if request.method == 'POST':
        ssn_id = request.POST['pat_id']
        u_id = user.objects.get(Ssn_id=ssn_id).user_id
        request.session['patient_id'] = u_id
        if request.POST['type'] == '1':
            print('we did it')
            return HttpResponseRedirect('Analytics/')
        elif request.POST['type'] == '2':
            print('rays')
            return HttpResponseRedirect('Rays/')
        else:
            print('Please Choose right type')
    else:
        return render(request,'labIndex.html',{})


def AnalyticsListView(request):
    patient_id = request.session['patient_id']
    lab_id = request.session['org_id']
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
    patient_id = request.session['patient_id']
    lab_id = request.session['org_id']
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