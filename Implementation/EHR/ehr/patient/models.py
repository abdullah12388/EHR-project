from django.db import models

from hospital.models import organization, hospital
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
    gender = models.CharField(max_length=10)
    country = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    street = models.CharField(max_length=100)
    zip_code = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=100)
    home_phone_number = models.CharField(max_length=100)
    work_phone_number = models.CharField(max_length=100)
    Date_of_birth = models.DateField()
    marital_status = models.CharField(max_length=20)
    Child_num = models.IntegerField()
    email_1 = models.EmailField(max_length=100)
    email_2 = models.EmailField(max_length=100, null=True, blank=True)
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

    def __str__(self):
        return self.first_name


class patient(models.Model):
    Patient = models.ForeignKey(user, on_delete=models.CASCADE)
    Emergency_contact = models.CharField(max_length=50)
    QR_code = models.CharField(max_length=500)
    Disability_status = models.CharField(max_length=10)
    Height = models.FloatField()
    weight = models.FloatField()
    Blood_type = models.CharField(max_length=5)
    Chronic_diseases = models.CharField(max_length=10)

    def __str__(self):
        return self.Patient.first_name


class AllNotification(models.Model):
    patientRecipient = models.ForeignKey(patient, on_delete=models.CASCADE, related_name='patient_recipient')
    doctorSenderId = models.ForeignKey(user, on_delete=models.CASCADE, null=True,
                                       related_name='sender_doctor_notification')
    hospitalSenderId = models.ForeignKey(hospital, on_delete=models.CASCADE, null=True,
                                         related_name='sender_hospital_notification')
    pharmacySenderId = models.ForeignKey(organization, on_delete=models.CASCADE, null=True,
                                         related_name='sender_pharmacy_notification')
    LabSenderId = models.ForeignKey(organization, on_delete=models.CASCADE, null=True,
                                    related_name='sender_lab_notification')
    message = models.TextField()
    read = models.BooleanField(default=False)
    recieved_date = models.DateTimeField(auto_now_add=True)


class rate(models.Model):
    Patient = models.ForeignKey(patient, on_delete=models.CASCADE, related_name='patient_rate')
    Doctor = models.ForeignKey(user,null=True, on_delete=models.CASCADE, related_name='doctor_rate')
    Hospital = models.ForeignKey(hospital, null=True, on_delete=models.CASCADE, related_name='hospital_rate')
    Lab = models.ForeignKey(organization,null=True, on_delete=models.CASCADE, related_name='lab_rate')
    Pharmacy = models.ForeignKey(organization, null=True,on_delete=models.CASCADE, related_name='pharmacy_rate')
    Rate = models.IntegerField()
    comment = models.TextField()

