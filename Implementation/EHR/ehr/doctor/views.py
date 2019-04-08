from django.shortcuts import render
from .forms import GetPatianTIDForm
from patient.views import DB_functions
from patient.models import user
from django.http import HttpResponseRedirect


def doctor(request):
    user_type = request.session['user_T']
    user_id = request.session['doctor_id']
    context = {'ID' : user_id , 'Type' : user_type}
    return render(request, 'Doctor_app/Doctor_index.html', context)

def GetPatianTID (request):
    if request.method == 'POST':
        Get_PatianT_ID_Form = GetPatianTIDForm(request.POST)
        if Get_PatianT_ID_Form.is_valid():
            Email = Get_PatianT_ID_Form.cleaned_data.get('email_1')
            password = Get_PatianT_ID_Form.cleaned_data.get('New_Password')
            Patiant_Data = user.objects.get(email_1=Email,New_Password = password)
            if Patiant_Data.User_type != 1:
                return HttpResponseRedirect('/doctor/patiant/?alert=Not A Patiant')
            if Patiant_Data.User_type == 1:
                request.session['Doctor_Patiant_ID']  = Patiant_Data.user_id
                return HttpResponseRedirect('/doctor')
    else:
        Get_PatianT_ID_Form = GetPatianTIDForm()
        return render(request,'Doctor_app/Patiant_ID_singup.html',{'Patiant_form':Get_PatianT_ID_Form})
