from django.shortcuts import render
from .forms import GetPatianTIDForm,PrescriptionForm
from patient.views import DB_functions
from patient.models import user,patient
from .models import prescription,report,doctor
from django.http import HttpResponseRedirect
from django.contrib.auth.hashers import check_password
from django.views.generic import (View,TemplateView,DeleteView,DetailView,ListView,CreateView,FormView,UpdateView)



def Doctor(request):
    if 'doctor_id' not in request.session:
        return HttpResponseRedirect('/patient/login/')
    else:
        user_type = request.session['user_T']
        user_id = request.session['doctor_id']
        p_id = request.session['Doctor_Patiant_ID']
    context = {'ID' : user_id , 'Type' : user_type , 'p_id' : p_id}
    return render(request, 'Doctor_app/Doctor_index.html', context)

def GetPatianTID (request):
    if 'doctor_id' not in request.session:
        return HttpResponseRedirect('/patient/login/')
    else:
        if request.method == 'POST':
            Get_PatianT_ID_Form = GetPatianTIDForm(request.POST)
            if Get_PatianT_ID_Form.is_valid():
                Email = Get_PatianT_ID_Form.cleaned_data.get('email_1')
                print(Email)
                password = Get_PatianT_ID_Form.cleaned_data.get('New_Password')
                print(password)
                user_is_exist = user.objects.filter(email_1__iexact=Email).exists()
                if user_is_exist:
                    get = user.objects.get(email_1=Email)
                    user_id = get.user_id
                    print(user_id)
                    password_db = get.New_Password
                    print(password_db)
                    user_Type_number = get.User_type
                    print(user_Type_number)
                if check_password(password=password , encoded=password_db):
                    if user_Type_number != 1:
                        return HttpResponseRedirect('/doctor/patiant/?alert=Not A Patiant')
                    if user_Type_number == 1:
                        request.session['Doctor_Patiant_ID']  = user_id
                        print(request.session['Doctor_Patiant_ID'])
                        return HttpResponseRedirect('/doctor/patiant/prescription/')
                else:
                    return HttpResponseRedirect('/doctor/patiant/?alert=wrong_password')
        else:
            Get_PatianT_ID_Form = GetPatianTIDForm()
            return render(request,'Doctor_app/Patiant_ID_singup.html',{'Patiant_form':Get_PatianT_ID_Form})

class ReportListView(ListView):
    model = report
    template_name = 'Doctor_app/prescription_list.html'
    context_object_name = 'prescription'
    redirect_url = '/doctor/patiant/prescription/'

    def get_queryset (self):
        if 'Doctor_Patiant_ID' in self.request.session:
            Doctor_Patiant_ID = self.request.session['Doctor_Patiant_ID']
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
        patient_instance = patient.objects.get(Patient=Doctor_Patiant_ID)
        Doc_instance = doctor.objects.get(id=D_ID)
        create_report = report.objects.create(prescription=Prescription_Instance,doctor=Doc_instance,patient=patient_instance)
        return HttpResponseRedirect("/doctor/patiant/prescription/")

class prescriptionUpdate (UpdateView):
    fields = '__all__'
    model = prescription
    template_name = 'Doctor_app/prescription_form.html'
