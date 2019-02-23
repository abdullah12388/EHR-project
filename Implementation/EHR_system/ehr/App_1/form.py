from django import forms
from .models import admin,user


class AddManager(forms.ModelForm):

    email = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'placeholder': 'E-mail',
        'maxlength': 250,
        'required': 'required',
         }))
    password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 5,
        'maxlength': 7,
        'required': 'required'
    }))
    re_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 5,
        'maxlength': 7,
        'required': 'required'
    }))

    class Meta:
        model = admin
        fields = ['email', 'password', 're_password']


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
    gender = forms.IntegerField(widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': '1-M 2-F',
        'required': 'required'
    }),min_value=1,max_value=2)
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
        'required': 'required'
    }))
    marital_status = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Marital Status',
        'required': 'required'
    }))
    Child_num = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[0-9]{1,2}',
        'placeholder': 'Children',
        'required': 'required'
    }))
    email_1 = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$',
        'placeholder': 'First E-mail',
        'required': 'required'
    }))
    email_2 = forms.EmailField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$',
        'placeholder': 'Second E-mail',
        'required': 'required'
    }))
    Nationality = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'pattern': '[a-z]{5,}',
        'placeholder': 'Nationality',
        'required': 'required'
    }))
    Profile_picture = forms.FileField(widget=forms.ClearableFileInput(attrs={
        'class': 'inputfile',
        'name': 'file',
        'id': 'file1',
        'required' : 'required',
    }))
    SSN_Picture = forms.FileField(widget=forms.ClearableFileInput(attrs={
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
        'pattern': '[0-9]{1}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{3}-[0-9]{2}',
        'placeholder': 'SSN X-XX-XX-XX-XX-XXX-XX',
        'required': 'required'
    }))
    # Ssn_id = forms.CharField(widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'pattern': '[0-9]{7}',
    #     'placeholder': 'ID XXXXXXX',
    #     'required': 'required'
    # }))
    New_Password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'pattern': '(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}',
        'placeholder': 'New Pass',
        'required': 'required'
    }))
    Confirm_Pass = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'pattern': '(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}',
        'placeholder': 'Confirm Pass',
        'required': 'required'
    }))

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
                  'SSN_Picture']
