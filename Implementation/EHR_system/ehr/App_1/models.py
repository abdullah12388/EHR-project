from django.db import models

# Create your models here.


class admin(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255)


class manager(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    country = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    blocked = models.BooleanField(default=False)

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
    Date_of_birth = models.CharField(max_length=100)
    marital_status = models.CharField(max_length=100)
    Child_num = models.CharField(max_length=100)
    email_1 = models.EmailField(max_length=100)
    email_2 = models.EmailField(max_length=100)
    Nationality = models.CharField(max_length=100)
    Profile_picture = models.CharField(max_length=100)
    Job_name = models.CharField(max_length=100)
    Job_organization = models.CharField(max_length=100)
    Jop_place = models.CharField(max_length=100)
    Ssn = models.CharField(max_length=100)
    Ssn_id = models.CharField(max_length=100)
    New_Password = models.CharField(max_length=100)
    SSN_Picture = models.CharField(max_length=100)
    User_type = models.IntegerField()
    Create_date = models.DateTimeField(auto_now_add=True)


class patient(models.Model):
    Patient = models.ForeignKey(user)
    Emergency_contact = models.CharField(max_length=50)
    QR_code = models.TextField()
    Disability_status = models.BooleanField(default=False)
    Height = models.FloatField()
    weight = models.FloatField()
    Blood_type = models.CharField(max_length=50)
    Chronic_diseases = models.BooleanField(default=False)


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
    h_date = models.DateTimeField(auto_now_add=True)
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
    creation_date = models.DateTimeField()
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
    creation_date = models.DateTimeField(auto_now_add=True)
    org_rate = models.IntegerField()
    Type = models.IntegerField()
    hospital_id = models.ForeignKey(hospital)

    def __str__(self):
        return self.org_email


class doctor(models.Model):
    Doc_id = models.ForeignKey(user)
    Registration_num = models.CharField(max_length=50)
    Specialization = models.CharField(max_length=100)
    Registration_date = models.DateTimeField(auto_now_add=True)
    licence = models.CharField(max_length=250)
    Last_date_payment = models.DateTimeField(auto_now=True)
    End_date = models.DateTimeField(auto_now=True)
    Specialization_type = models.CharField(max_length=100)
    University = models.CharField(max_length=100)
    Work_place = models.CharField(max_length=100)
    Sub_syndicate = models.CharField(max_length=500)
    General_secretary = models.CharField(max_length=500)
    Working_till = models.DateTimeField(auto_now=True)
    Graduation_year = models.CharField(max_length=50)
    doc_rate = models.IntegerField()
    hospital_id = models.ForeignKey(hospital)
    clinic_id = models.ForeignKey(organization)


class prescription(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    Disease_name = models.CharField(max_length=100)
    Disease_level = models.CharField(max_length=100)
    Disease_disc = models.TextField()
    Doctor_signature = models.CharField(max_length=500)
    next_appointment = models.DateTimeField()
    Submit_date = models.DateTimeField(auto_now_add=True)


class report(models.Model):
    report_id = models.AutoField(primary_key=True)
    patient_id = models.ForeignKey(patient)
    prescription_id = models.ForeignKey(prescription)
    doctor_id = models.ForeignKey(doctor)


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
    pat_id = models.ForeignKey(patient)
    analy_id = models.ForeignKey(all_analytics)
    analytics_result = models.TextField()
    lab_id = models.ForeignKey(organization)


class patient_chronic(models.Model):
    P_C_id = models.AutoField(primary_key=True)
    pat_id = models.ForeignKey(patient)
    chr_id = models.ForeignKey(all_chronic)


class patient_medicine(models.Model):
    P_M_id = models.AutoField(primary_key=True)
    pat_id = models.ForeignKey(patient)
    med_id = models.ForeignKey(all_medicine)
    number_of_potions = models.IntegerField()
    number_of_pills = models.IntegerField()
    medicine_submit = models.BooleanField(default=False)
    pharmacy_id = models.ForeignKey(organization)


class patient_rays(models.Model):
    P_R_id = models.AutoField(primary_key=True)
    pat_id = models.ForeignKey(patient)
    ray_id = models.ForeignKey(all_rays)
    rays_result = models.TextField()
    lab_id = models.ForeignKey(organization)


class multi_analytics(models.Model):
    report_id = models.ForeignKey(report)
    P_A_id = models.ForeignKey(patient_analytics)


class multi_chronic(models.Model):
    report_id = models.ForeignKey(report)
    P_C_id = models.ForeignKey(patient_chronic)


class multi_medecines(models.Model):
    report_id = models.ForeignKey(report)
    P_M_id = models.ForeignKey(patient_medicine)


class multi_rays(models.Model):
    report_id = models.ForeignKey(report)
    P_R_id = models.ForeignKey(patient_rays)


class blocked_hospitals(models.Model):
    manager_id = models.ForeignKey(manager)
    hospital_id = models.ForeignKey(hospital)


class blocked_organizations(models.Model):
    manager_id = models.ForeignKey(manager)
    organ_id = models.ForeignKey(organization)


class blocked_users(models.Model):
    manager_id = models.ForeignKey(manager)
    user_id = models.ForeignKey(user)

