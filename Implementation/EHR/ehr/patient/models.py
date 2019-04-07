from django.db import models

# Create your models here.


class temp_register(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255)
    def __str__(self):
        return self.email

class user(models.Model):
    user_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=100)
    middle_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    gender = models.IntegerField()
    country = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    street = models.CharField(max_length=100)
    zip_code = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=100)
    home_phone_number = models.CharField(max_length=100)
    work_phone_number = models.CharField(max_length=100)
    Date_of_birth = models.DateField()
    marital_status = models.CharField(max_length=100)
    Child_num = models.CharField(max_length=100)
    email_1 = models.EmailField(max_length=100)
    email_2 = models.EmailField(max_length=100)
    Nationality = models.CharField(max_length=100)
    Profile_picture = models.ImageField()
    Job_name = models.CharField(max_length=100)
    Job_organization = models.CharField(max_length=100)
    Jop_place = models.CharField(max_length=100)
    Ssn = models.CharField(max_length=100)
    Ssn_id = models.CharField(max_length=100)
    New_Password = models.CharField(max_length=100)
    SSN_Picture = models.ImageField()
    User_type = models.IntegerField()
    Create_date = models.DateTimeField(auto_now_add=True)


class patient(models.Model):
    Patient = models.ForeignKey(user, on_delete=models.CASCADE)
    Emergency_contact = models.CharField(max_length=50)
    QR_code = models.CharField(max_length=500)
    Disability_status = models.BooleanField(default=False)
    Height = models.FloatField()
    weight = models.FloatField()
    Blood_type = models.CharField(max_length=500)
    Chronic_diseases = models.BooleanField(default=False)