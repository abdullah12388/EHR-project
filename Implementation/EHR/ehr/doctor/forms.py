from django import forms
from patient.models import patient
from doctor.models import report,user,prescription,patient_medicine,patient_rays,patient_analytics
from django.contrib.auth.hashers import make_password

class GetPatianTIDForm (forms.ModelForm):
    class Meta():
        model = user
        fields = ['Ssn_id']

class PrescriptionForm (forms.ModelForm):
    Disease_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Disease Name',
        'required': 'required'
    }))
    Disease_level = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{1,}',
        'placeholder': 'Disease Level',
        'required': 'required'
    }))
    Disease_disc = forms.CharField(widget=forms.Textarea(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Disease Discription',
        'required': 'required'
    }))
    Doctor_signature = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Doctor Signature',
        'required': 'required'
    }))
    next_appointment = forms.DateTimeField(widget=forms.DateTimeInput(attrs={
        'class': 'form-control',
        'placeholder': 'Next Appointment',
        'required': 'required'
    }))
    class Meta():
        model = prescription
        # exclude = ['prescription_id']
        fields = (
            'Disease_name',
            'Disease_level',
            'Disease_disc',
            'Doctor_signature',
            'next_appointment',
        )

class AddmedicenForm (forms.ModelForm):
    number_of_potions = forms.IntegerField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Number of Potions',
        'required': 'required'
    }), min_value=0)
    number_of_pills = forms.IntegerField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Number of Pills',
        'required': 'required'
    }), min_value=0)
    class Meta():
        model = patient_medicine
        fields = ('med',
                  'number_of_potions',
                  'number_of_pills')

class AddRaysForm (forms.ModelForm):
    class Meta():
        model = patient_rays
        fields = ['ray']

class AddanalyticsForm (forms.ModelForm):
    class Meta():
        model = patient_analytics
        fields = ['analy']
