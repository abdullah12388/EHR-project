from django import forms
from patient.models import patient
from doctor.models import report,user
from django.contrib.auth.hashers import make_password

class GetPatianTIDForm (forms.ModelForm):
    class Meta():
        model = user
        fields = ('email_1' , 'New_Password')
