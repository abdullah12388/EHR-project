from django import forms
from .models import admin
from .models import temp

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
        fields = ['email','password', 're_password']


class AddTemp(forms.ModelForm):
    first_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 5,
        'maxlength': 7,
        'required': 'required'
    }))
    last_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Password',
        'minlength': 5,
        'maxlength': 7,
        'required': 'required',
        #'type': 'password'
    }))
    # temp_id = forms.IntegerField(widget=forms.NumberInput(attrs={
    #     'class': 'display'
    # }))

    class Meta:
        model = temp
        fields = ['first_name','last_name']
