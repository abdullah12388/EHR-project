from django import forms
from .models import *
from doctor.models import report
from django.contrib.auth.hashers import make_password


class tempRegister(forms.ModelForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'placeholder': 'E-mail',
        'maxlength': 250,
        'required': 'required',
        'id': 'id_email'
    }))
    password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 8,
        'maxlength': 100,
        'required': 'required',
        'id': 'pass'
    }))
    re_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 8,
        'maxlength': 100,
        'required': 'required',
        'id': 're_pass'
    }))
    re_password.label = 'Repeat password'

    def clean_password(self):
        password = self.cleaned_data.get('password')
        return make_password(password)

    class Meta:
        model = temp_register
        fields = ['email', 'password', 're_password']

class login(forms.ModelForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'placeholder': 'E-mail',
        'maxlength': 250,
        'required': 'required',
        'id': 'id_email'
    }))
    password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 8,
        'maxlength': 100,
        'required': 'required',
        'id': 'id_pass'
    }))
    class Meta:
        model = temp_register
        fields = ['email', 'password']



class patientLoginToPharmacyForm(forms.ModelForm):
    Ssn_id = forms.IntegerField(widget=forms.NumberInput(attrs={
        'class' : 'form-control',
        'placeholder' : 'Enter Patient Code',
        'required' : 'required',
        'maxlength' : 7,
    }))

    class Meta:
        model = patient
        fields = ['QR_code']



class AddUser(forms.ModelForm):

    first_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'First name',
        'required': 'required'
    }))
    middle_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Middle name',
        'required': 'required'
    }))
    last_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Last name',
        'required': 'required'
    }))
    gender = forms.CharField()
    country = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'Country',
        'required': 'required'
    }))
    state = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'State',
        'required': 'required'
    }))
    city = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{3,}',
        'placeholder': 'City',
        'required': 'required'
    }))
    street = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z0-9]{3,}',
        'placeholder': 'Street',
        'required': 'required'
    }))
    zip_code = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{5}',
        'placeholder': 'Zip code',
        'required': 'required'
    }))
    phone_number = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{11}',
        'placeholder': 'Phone number',
        'required': 'required'
    }))
    home_phone_number = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{10,11}',
        'placeholder': 'Home Phone',
        'required': 'required'
    }))
    work_phone_number = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{10,11}',
        'placeholder': 'Work Phone',
        'required': 'required'
    }))
    Date_of_birth = forms.DateField(widget=forms.DateInput(attrs={
        'class': 'form-control',
        'placeholder': 'Birth Date',
        'required': 'required',
        'type': 'date'
    }),input_formats=['%Y-%m-%d','%m/%d/%Y','%m/%d/%y','%d-%m-%Y'])
    marital_status = forms.CharField()
    Child_num = forms.IntegerField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'children',
        'required': 'required'
    }), min_value=0, max_value=20)
    email_1 = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$',
        'placeholder': 'First E-mail',
        'required': 'required',
        'id': 'id_email_2',
        'name':'email_1'
    }))
    email_2 = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$',
        'placeholder': 'Second E-mail',
        'required': 'required'
    }))
    Nationality = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Nationality',
        'required': 'required'
    }))
    Profile_picture = forms.ImageField(required=False,widget=forms.ClearableFileInput(attrs={
        'class': 'inputfile',
        'name': 'file',
        'id': 'file1',
        'required': 'required',
    }))
    SSN_Picture = forms.ImageField(required=False,widget=forms.ClearableFileInput(attrs={
        'class': 'inputfile',
        'name': 'file',
        'id': 'file2',
        'required': 'required'
    }))
    Job_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Jop Title',
        'required': 'required'
    }))
    Job_organization = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Jop Organization',
        'required': 'required'
    }))
    Jop_place = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Jop Place',
        'required': 'required'
    }))
    Ssn = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'SSN X-XX-XX-XX-XX-XXX-XX',
        'required': 'required'
    }))
    Ssn_id = forms.CharField(widget=forms.TextInput(attrs={
        'value': '1234567',
        'type': 'hidden'
    }))
    User_type = forms.IntegerField(widget=forms.NumberInput(attrs={
        'value': '1',
        'type': 'hidden'
    }))
    New_Password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'pattern': '(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}',
        'placeholder': 'New Pass',
        'required': 'required',
        'id': 'pass'
    }))
    Confirm_Pass = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'pattern': '(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}',
        'placeholder': 'Confirm Pass',
        'required': 'required',
        'id': 're_pass'
    }))

    def clean_New_Password(self):
        password = self.cleaned_data.get('New_Password')
        return make_password(password)


    class Meta:
        model = user
        fields = ['first_name',
                  'middle_name',
                  'last_name',
                  'gender',
                  'country',
                  'state',
                  'city',
                  'street',
                  'zip_code',
                  'phone_number',
                  'home_phone_number',
                  'work_phone_number',
                  'Date_of_birth',
                  'marital_status',
                  'Child_num',
                  'email_1',
                  'email_2',
                  'Nationality',
                  'Profile_picture',
                  'Job_name',
                  'Job_organization',
                  'Jop_place',
                  'Ssn',
                  'Ssn_id',
                  'New_Password',
                  'SSN_Picture',
                  'User_type']

class AddPatient(forms.ModelForm):

    Emergency_contact = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{10,11}',
        'placeholder': 'Emergency contact',
        'required': 'required'
    }))
    QR_code = forms.CharField(widget=forms.TextInput(attrs={
        'value': 'QR123213123123',
        'type': 'hidden'
    }))
    Disability_status = forms.CharField()
    Height = forms.FloatField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Height in cm',
        'required': 'required'
    }),min_value=1,max_value=400)
    weight = forms.FloatField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Weight in kg',
        'required': 'required'
    }),min_value=1,max_value=400)
    Blood_type = forms.CharField()
    Chronic_diseases = forms.CharField()

    class Meta:
        model = patient
        fields = ['Emergency_contact',
                  'Disability_status',
                  'Height',
                  'weight',
                  'Blood_type',
                  'Chronic_diseases',
                  'QR_code']

class searchHistory(forms.ModelForm):
    search_content = forms.CharField(widget=forms.TextInput(attrs={
        'class': '',
        'placeholder': 'search...',
        'maxlength': 250,
        'required': 'required',
        'id': 'id_search'
    }))
    class Meta:
        model = report
        fields = ['search_content']

