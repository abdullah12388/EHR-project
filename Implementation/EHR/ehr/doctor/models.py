from django.db import models
from django.urls import reverse

from patient.models import user,patient
from hospital.models import hospital,organization
# Create your models here.


class doctor(models.Model):
    Doc = models.ForeignKey(user, on_delete=models.CASCADE)
    Registration_num = models.CharField(max_length=50)
    Specialization = models.CharField(max_length=100)
    Registration_date = models.DateTimeField(auto_now_add=True)
    licence = models.CharField(max_length=250)
    Last_date_payment = models.DateField(auto_now=True)
    End_date = models.DateField(auto_now=True)
    Specialization_type = models.CharField(max_length=100)
    University = models.CharField(max_length=100)
    Work_place = models.CharField(max_length=100)
    Sub_syndicate = models.CharField(max_length=500)
    General_secretary = models.CharField(max_length=500)
    Working_till = models.TimeField(auto_now=True)
    Graduation_year = models.CharField(max_length=50)
    doc_rate = models.IntegerField()
    hospital = models.ForeignKey(hospital, blank=True, null=True, on_delete=models.CASCADE)
    clinic = models.ForeignKey(organization, blank=True, null=True, on_delete=models.CASCADE)

    # def get_absolute_url(self):
    #     """Returns the url to access a particular book instance."""
    #     return reverse('doctor:home', args=[str(self.id)])


class prescription(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    Disease_name = models.CharField(max_length=100)
    Disease_level = models.CharField(max_length=100)
    Disease_disc = models.TextField()
    Doctor_signature = models.CharField(max_length=500)
    next_appointment = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.Disease_name

class report(models.Model):
    report = models.AutoField(primary_key=True)
    patient = models.ForeignKey(patient, on_delete=models.CASCADE)
    prescription = models.ForeignKey(prescription, on_delete=models.CASCADE)
    doctor = models.ForeignKey(doctor, on_delete=models.CASCADE)
    clinic = models.ForeignKey(organization, on_delete=models.CASCADE, blank=True, null=True)
    hospital = models.ForeignKey(hospital, on_delete=models.CASCADE, blank=True, null=True)
    Submit_date = models.DateTimeField(auto_now_add=True)




class all_analytics(models.Model):
    analytics_id = models.AutoField(primary_key=True)
    analytics_name = models.CharField(max_length=250)


class all_chronic(models.Model):
    chronic_id = models.AutoField(primary_key=True)
    chronic_name = models.CharField(max_length=250)


class all_medicine(models.Model):
    medicine_id = models.AutoField(primary_key=True)
    medicine_name = models.CharField(max_length=250)


class all_rays(models.Model):
    ray_id = models.AutoField(primary_key=True)
    ray_name = models.CharField(max_length=250)


class patient_analytics(models.Model):
    P_A_id = models.AutoField(primary_key=True)
    pat = models.ForeignKey(patient, on_delete=models.CASCADE)
    analy = models.ForeignKey(all_analytics, on_delete=models.CASCADE)
    analytics_result = models.TextField()
    lab = models.ForeignKey(organization, on_delete=models.CASCADE,null=True,blank=True)


class patient_chronic(models.Model):
    P_C_id = models.AutoField(primary_key=True)
    pat = models.ForeignKey(patient, on_delete=models.CASCADE)
    chr = models.ForeignKey(all_chronic, on_delete=models.CASCADE)


class patient_medicine(models.Model):
    P_M_id = models.AutoField(primary_key=True)
    pat = models.ForeignKey(patient, on_delete=models.CASCADE)
    med = models.ForeignKey(all_medicine, on_delete=models.CASCADE)
    number_of_potions = models.IntegerField()
    number_of_pills = models.IntegerField()
    pharmacy = models.ForeignKey(organization, on_delete=models.CASCADE,null=True,blank=True)



class patient_rays(models.Model):
    P_R_id = models.AutoField(primary_key=True)
    pat = models.ForeignKey(patient, on_delete=models.CASCADE)
    ray = models.ForeignKey(all_rays, on_delete=models.CASCADE)
    rays_result = models.TextField()
    lab = models.ForeignKey(organization, on_delete=models.CASCADE,null=True,blank=True)


class multi_analytics(models.Model):
    report = models.ForeignKey(report, on_delete=models.CASCADE)
    P_A= models.ForeignKey(patient_analytics, on_delete=models.CASCADE)


class multi_chronic(models.Model):
    report = models.ForeignKey(report, on_delete=models.CASCADE)
    P_C = models.ForeignKey(patient_chronic, on_delete=models.CASCADE)


class multi_medecines(models.Model):
    report = models.ForeignKey(report, on_delete=models.CASCADE)
    P_M = models.ForeignKey(patient_medicine, on_delete=models.CASCADE)


class multi_rays(models.Model):
    report = models.ForeignKey(report, on_delete=models.CASCADE)
    P_R = models.ForeignKey(patient_rays, on_delete=models.CASCADE)
