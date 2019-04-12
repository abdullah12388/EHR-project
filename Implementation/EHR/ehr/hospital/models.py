from django.db import models

# Create your models here.


class hospital(models.Model):
    h_id = models.AutoField(primary_key=True)
    h_name = models.CharField(max_length=500)
    h_country = models.CharField(max_length=100)
    h_state = models.CharField(max_length=100)
    h_city = models.CharField(max_length=100)
    h_street = models.CharField(max_length=100)
    h_zipcode = models.CharField(max_length=50)
    h_phone_num = models.CharField(max_length=100)
    h_type = models.CharField(max_length=100)
    h_ownership = models.CharField(max_length=100)
    h_emergency_service = models.BooleanField()
    h_date = models.DateField(auto_now_add=True)
    email = models.EmailField(max_length=100)
    website = models.TextField()
    logo = models.TextField()
    internal_medicine = models.IntegerField()
    cardiology = models.IntegerField()
    endocrinology = models.IntegerField()
    hematology = models.IntegerField()
    nephrology = models.IntegerField()
    surgery = models.IntegerField()
    pediatric = models.IntegerField()
    obstertics_genacology = models.IntegerField()
    ophthalmologist = models.IntegerField()
    neurology = models.IntegerField()
    Ear_nose_threat = models.IntegerField()
    urology = models.IntegerField()
    dermatology = models.IntegerField()
    hepatology = models.IntegerField()
    Radiology = models.IntegerField()
    psychiatry = models.IntegerField()
    dentistry = models.IntegerField()
    forensic_medicine = models.IntegerField()
    enatony = models.IntegerField()
    num_of_bed = models.IntegerField()
    hr_username = models.CharField(max_length=250)
    hr_password = models.CharField(max_length=250)
    creation_date = models.DateField()
    hos_rate = models.IntegerField()

    def __str__(self):
        return self.email


class organization(models.Model):
    org_id = models.AutoField(primary_key=True)
    org_name = models.CharField(max_length=250)
    org_country = models.CharField(max_length=100)
    org_state = models.CharField(max_length=100)
    org_city = models.CharField(max_length=100)
    org_zipcode = models.CharField(max_length=100)
    org_phone_num = models.CharField(max_length=50)
    org_email = models.EmailField(max_length=100)
    org_website = models.TextField()
    org_logo = models.TextField()
    hr_username = models.CharField(max_length=100)
    hr_password = models.CharField(max_length=100)
    creation_date = models.DateField(auto_now_add=True)
    org_rate = models.IntegerField()
    #0 for hospital
    #1 for lab
    #2 for pharmacy
    Type = models.IntegerField()
    hospital = models.ForeignKey(hospital, blank=True, null=True, on_delete=models.CASCADE)

