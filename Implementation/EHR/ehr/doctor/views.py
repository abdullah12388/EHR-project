from django.shortcuts import render,get_object_or_404
from .forms import GetPatianTIDForm,PrescriptionForm,AddmedicenForm,AddRaysForm,AddanalyticsForm
from patient.views import DB_functions
from patient.models import user, patient, AllNotification
from hospital.models import hospital
from .models import (prescription,report,doctor,multi_medecines,
patient_medicine,all_medicine,multi_rays,multi_analytics
,patient_rays,all_rays,patient_analytics,multi_analytics)
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth.hashers import check_password
from django.views.generic import (View,TemplateView,DeleteView,DetailView,ListView,CreateView,FormView,UpdateView)
# from django.core.urlresolvers import reverse
from django.urls import reverse
from patient.views import QRCodeScanner
from rest_framework.views import APIView
from rest_framework.response import Response


import cv2
import numpy as np
import pyzbar.pyzbar as pyzbar


def Doctor(request):
    if 'doctor_id' not in request.session:
        return HttpResponseRedirect('/patient/')
    else:
        user_type = request.session['user_T']
        user_id = request.session['doctor_id']
        p_id = request.session['Doctor_Patiant_ID']
    context = {'ID' : user_id , 'Type' : user_type , 'p_id' : p_id}
    return render(request, 'Doctor_app/Doctor_index.html', context)

def GetPatianTID (request):
    if 'doctor_id' not in request.session:
        return HttpResponseRedirect('/patient/')
    else:
        if request.method == 'POST':

            # QRData = patient.views.QRCodeScanner()
            # QRData = QRData.decode("UTF-8")
            # if QRData:
            #     ssn_id = QRData
            # else:
            ssn_id = request.POST['pat_id']
            print(ssn_id)
            user_is_exist = user.objects.filter(Ssn_id=ssn_id).exists()
            if user_is_exist:
                get = user.objects.get(Ssn_id=ssn_id)
                user_id = get.user_id
                patientget = patient.objects.get(Patient_id = user_id)
                p_id = patientget.id
                print(user_id)
                user_Type_number = get.User_type
                print(user_Type_number)

            if user_Type_number != 1:
                return HttpResponseRedirect('/doctor/patiant/?alert=Not A Patiant')
            if user_Type_number == 1:
                request.session['Doctor_Patiant_ID']  = p_id
                print(request.session['Doctor_Patiant_ID'])
                return HttpResponseRedirect('/doctor/patiant/prescription/')

        else:
            Get_PatianT_ID_Form = GetPatianTIDForm()
            return render(request,'Doctor_app/Patiant_ID_singup.html',{'ID':request.session['doctor_id'],'Patiant_form':Get_PatianT_ID_Form})


def QRCodeScanView(request):
    QRData = QRCodeScanner()
    QRData = QRData.decode("UTF-8")
    getUser = user.objects.get(Ssn_id=QRData)


    if getUser:
        user_Type_number = getUser.User_type

        ssn_id = QRData
        print(ssn_id)
        user_is_exist = user.objects.filter(Ssn_id=ssn_id).exists()
        if user_is_exist:
            get = user.objects.get(Ssn_id=ssn_id)
            user_id = get.user_id
            patientget = patient.objects.get(Patient_id=user_id)
            p_id = patientget.id
            print(user_id)
            user_Type_number = get.User_type
            print(user_Type_number)

        if user_Type_number == 1:
            request.session['Doctor_Patiant_ID'] = p_id
            print(request.session['Doctor_Patiant_ID'])
            return HttpResponseRedirect('/doctor/patiant/prescription/')
        else:
            return HttpResponseRedirect('/doctor/')
    else:
        return HttpResponseRedirect('/doctor/')




class ReportListView(ListView):
    model = report
    template_name = 'Doctor_app/prescription_list.html'
    context_object_name = 'prescription'
    redirect_url = '/doctor/patiant/prescription/'

    def get_queryset (self):
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
            print(Doctor_Patiant_ID);
        else:
            print("not Found");

        return report.objects.filter(patient=Doctor_Patiant_ID)

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class PrescriptionDetialView(DetailView):
    model = prescription
    template_name = 'Doctor_app/prescription_detail.html'
    context_object_name = 'presc_detial'
    redirect_url = '/doctor/patiant/prescription/'
    #self.kwargs['pk']
    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class prescriptionFormView (FormView):
    template_name = 'Doctor_app/prescription_form.html'
    form_class = PrescriptionForm

    def form_valid(self, form):
        form.save()
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
        if 'doctor_id' in self.request.session:
            D_ID = self.request.session['doctor_id']
        Prescription_Instance = prescription.objects.last()
        patient_instance = patient.objects.get(id=Doctor_Patiant_ID)
        Doc_instance = doctor.objects.get(id=D_ID)
        create_report = report.objects.create(prescription=Prescription_Instance,doctor=Doc_instance,patient=patient_instance)
        ##################### khan added from here to make notifications available ##################
        #creating instance from table "AllNotification" to affect and get notification from it
        notificationToBeSentToPatientFromDoctor = AllNotification()
        #taking ID from session of the doctor and patient I did't use what omar did because i need user instance
        doctorIdInSession = self.request.session['doctor_id']
        patientIdInSession = self.request.session['patient_id']
        doctorId = user.objects.get(user_id=doctorIdInSession)
        patientId = user.objects.get(user_id=patientIdInSession)
        #affecting table "AllNotification" and save data to preview to the user
        notificationToBeSentToPatientFromDoctor.doctorSenderId = doctorId
        notificationToBeSentToPatientFromDoctor.patientRecipient = patientId
        notificationToBeSentToPatientFromDoctor.message = 'Doctor ' + doctorId.first_name +' added a new prescription'
        notificationToBeSentToPatientFromDoctor.save()
        #############################################################################################
        return HttpResponseRedirect(reverse('doctor:newmed', kwargs={'pk':create_report.prescription.prescription_id}))

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class prescriptionUpdate (UpdateView):
    form_class = PrescriptionForm
    model = prescription
    template_name = 'Doctor_app/prescription_form.html'

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class Medicen_List(ListView):
    model = multi_medecines
    context_object_name = 'medecines'
    template_name = 'Doctor_app/multi_medecines_list.html'
    def get_queryset(self):
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        return multi_medecines.objects.filter(report_id=reportid)

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class Medicin_DetialView(DetailView):
    model = patient_medicine
    context_object_name = 'med_p_detial'
    template_name = 'Doctor_app/patient_medicine_detail.html'
    redirect_url = '/doctor/patiant/prescription/'
    #self.kwargs['pk']

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class Medicen_UPDATE (UpdateView):
    fields = ('number_of_potions','number_of_pills','pharmacy')
    model = patient_medicine
    template_name = 'Doctor_app/patient_medicine_form.html'
    # form_class = AddmedicenForm
    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class MedicenFormView (FormView):
    template_name = 'Doctor_app/patient_medicine_form.html'
    form_class = AddmedicenForm

    def form_valid(self, form):
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
        instance = form.save(commit=False)
        instance.pat = patient.objects.get(id=Doctor_Patiant_ID)
        instance.save()
        P_mdecine_instance = patient_medicine.objects.last()
        print(self.kwargs['pk'])
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        report_Instance = report.objects.get(report=reportid)
        create_Med_report = multi_medecines.objects.create(report=report_Instance ,P_M=P_mdecine_instance)
        print(self.kwargs['pk'])
        return HttpResponseRedirect(reverse('doctor:medlist', kwargs={'pk': self.kwargs['pk']}))

class rays_List(ListView):
    model = multi_rays
    context_object_name = 'rays'
    template_name = 'Doctor_app/multi_rays_list.html'
    def get_queryset(self):
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        return multi_rays.objects.filter(report_id=reportid)

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class rays_DetialView(DetailView):
    model = patient_rays
    context_object_name = 'ray_p_detial'
    template_name = 'Doctor_app/patient_rays_detail.html'
    redirect_url = '/doctor/patiant/prescription/'
    #self.kwargs['pk']

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class rays_UPDATE (UpdateView):
    fields =  ['ray']
    model = patient_rays
    template_name = 'Doctor_app/patient_rays_form.html'
    # form_class = AddRaysForm
    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class raysFormView (FormView):
    template_name = 'Doctor_app/patient_rays_form.html'
    form_class = AddRaysForm

    def form_valid(self, form):
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
        instance = form.save(commit=False)
        instance.pat = patient.objects.get(id=Doctor_Patiant_ID)
        instance.save()
        P_ray_instance = patient_rays.objects.last()
        print(self.kwargs['pk'])
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        report_Instance = report.objects.get(report=reportid)
        create_Med_report = multi_rays.objects.create(report=report_Instance ,P_R=P_ray_instance)
        print(self.kwargs['pk'])
        return HttpResponseRedirect(reverse('doctor:rayslist', kwargs={'pk': self.kwargs['pk']}))

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class analytics_List(ListView):
    model = multi_analytics
    context_object_name = 'analytics'
    template_name = 'Doctor_app/multi_analytics_list.html'
    def get_queryset(self):
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        return multi_analytics.objects.filter(report_id=reportid)

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class analytics_DetialView(DetailView):
    model = patient_analytics
    context_object_name = 'analytics_p_detial'
    template_name = 'Doctor_app/patient_analytics_detail.html'
    redirect_url = '/doctor/patiant/prescription/'
    #self.kwargs['pk']

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class analytics_UPDATE (UpdateView):
    fields =  ['analy']
    model = patient_analytics
    template_name = 'Doctor_app/patient_analytics_form.html'
    # form_class = AddanalyticsForm
    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

class analyticsFormView (FormView):
    template_name = 'Doctor_app/patient_analytics_form.html'
    form_class = AddanalyticsForm

    def form_valid(self, form):
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
        instance = form.save(commit=False)
        instance.pat = patient.objects.get(id=Doctor_Patiant_ID)
        instance.save()
        P_analytics_instance = patient_analytics.objects.last()
        print(self.kwargs['pk'])
        reportdata = report.objects.get(prescription=self.kwargs['pk'])
        reportid = reportdata.report
        report_Instance = report.objects.get(report=reportid)
        create_Med_report = multi_analytics.objects.create(report=report_Instance ,P_A=P_analytics_instance)
        print(self.kwargs['pk'])
        return HttpResponseRedirect(reverse('doctor:analyticslist', kwargs={'pk': self.kwargs['pk']}))

    def render_to_response(self , redirect_url):
        if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
            return HttpResponseRedirect('/patient/login/')
        elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
            return HttpResponseRedirect('/')
        else:
           return super().render_to_response(redirect_url)

# def doctor_profile_view(request):
#     id = doctor.objects.get(id=request.session['doctor_id']).Doc_id
#     doctordata = doctor.objects.get(Doc_id=id)
#     userdata = user.objects.get(user_id=id)
#     context ={
#         'user': userdata,
#         'doctor': doctordata,
#     }
#     return render(request, 'doctorProfileView.html',context)

# def doctor_profile_view(request,docid=None):
#     doctordata = get_object_or_404(doctor,id=docid)
#     context ={
#         'doctor': doctordata,
#         'ID':doctordata.id,
#     }
#     return render(request, 'doctorProfileView.html',context)

# def doctor_profile_view(request,docid,hosid):
#     # pharmacyData = organization.objects.filter(Type=1).get(org_id=request.session['pharmacy_id'])
#     id = doctor.objects.get(id=docid).Doc_id
#     doctorData = doctor.objects.get(Doc_id=id)
#     hospitaldata = hospital.objects.get(h_id=hosid)
#     userdata = user.objects.get(user_id=id)
#     context ={
#         'doctor': doctorData,
#         'user': userdata,
#         'doc_id':doctorData.id,
#         'hospital':hospitaldata,
#     }
#     return render(request, 'doctorProfileView.html',context)

class doctorProfileDetialView(DetailView):
    model = doctor
    template_name = 'doctorProfileView.html'
    context_object_name = 'doctor'
    redirect_url = '/doctor/'
    #self.kwargs['pk']
    # def render_to_response(self , redirect_url):
    #     if 'doctor_id' not in self.request.session and 'patient_id' not in self.request.session:
    #         return HttpResponseRedirect('/patient/login/')
    #     elif 'patient_id' in self.request.session and 'doctor_id' not in self.request.session:
    #         return HttpResponseRedirect('/')
    #     else:
    #        return super().render_to_response(redirect_url)
class StatView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'Doctor_app/charts.html', {})

class DoctorStatistics(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self,request,format=None):
        labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']
        defulatdata_items = [12500,10000,15500,11151,12115,13891]
        data1 = {
        "label":labels,
        "default":defulatdata_items,
        }
        data2 = {
        "label":['Rd', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        "default":defulatdata_items,
        }
        data3 = {
        "label":labels,
        "default":defulatdata_items,
        }
        data = {
        "data1":data1,
        "data2":data2,
        "data3":data3,
        }
        return Response(data)
