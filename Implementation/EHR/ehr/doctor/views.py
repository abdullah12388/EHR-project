from django.shortcuts import render
from .forms import GetPatianTIDForm
from patient.views import DB_functions
from patient.models import user,patient
from django.http import HttpResponseRedirect
from django.contrib.auth.hashers import check_password

def doctor(request):
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
                        return HttpResponseRedirect('/doctor')
                else:
                    return HttpResponseRedirect('/doctor/patiant/?alert=wrong_password')
        else:
            Get_PatianT_ID_Form = GetPatianTIDForm()
            return render(request,'Doctor_app/Patiant_ID_singup.html',{'Patiant_form':Get_PatianT_ID_Form})
