from django.db import models

# Create your models here.


# class admin(models.Model):
#     id = models.AutoField(primary_key=True)
#     email = models.EmailField(max_length=255)
#     password = models.CharField(max_length=255)

# class temp(models.Model):
#     temp = models.ForeignKey(admin, on_delete=models.CASCADE)
#     first_name = models.CharField(max_length=255)
#     last_name = models.CharField(max_length=255)

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
    def __str__(self):
        return self.first_name


    def __str__(self):
        return self.first_name


class patient(models.Model):
    Patient = models.ForeignKey(user, on_delete=models.CASCADE)
    Emergency_contact = models.CharField(max_length=50)
    QR_code = models.CharField(max_length=500)
    Disability_status = models.BooleanField(default=False)
    Height = models.FloatField()
    weight = models.FloatField()
    Blood_type = models.CharField(max_length=500)
    Chronic_diseases = models.BooleanField(default=False)

    def __str__(self):
        return self.Emergency_contact


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
    # 1 for lab
    # 2 for pharmacy
    # 3 for hospital
    Type = models.IntegerField()
    hospital = models.ForeignKey(hospital, blank=True, null=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.org_email


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
    def __str__(self):
        return self.Doc.first_name


class prescription(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    Disease_name = models.CharField(max_length=100)
    Disease_level = models.CharField(max_length=100)
    Disease_disc = models.TextField()
    Doctor_signature = models.CharField(max_length=500)
    next_appointment = models.DateTimeField()


class report(models.Model):
    report = models.AutoField(primary_key=True)
    patient = models.ForeignKey(patient, on_delete=models.CASCADE)
    prescription = models.ForeignKey(prescription, on_delete=models.CASCADE)
    doctor = models.ForeignKey(doctor, on_delete=models.CASCADE)
    clinic = models.ForeignKey(organization, on_delete=models.CASCADE, blank=True, null=True)
    hospital = models.ForeignKey(hospital, on_delete=models.CASCADE, blank=True, null=True)
    Submit_date = models.DateTimeField(auto_now=False, auto_now_add=True)


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
    lab = models.ForeignKey(organization, on_delete=models.CASCADE)
    submit_analytics_date = models.DateTimeField()


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
    medicine_submit = models.BooleanField(default=False)
    pharmacy = models.ForeignKey(organization, on_delete=models.CASCADE)
    submit_medicine_date = models.DateTimeField()

class patient_rays(models.Model):
    P_R_id = models.AutoField(primary_key=True)
    pat = models.ForeignKey(patient, on_delete=models.CASCADE)
    ray = models.ForeignKey(all_rays, on_delete=models.CASCADE)
    rays_result = models.TextField()
    lab = models.ForeignKey(organization, on_delete=models.CASCADE)
    submit_rays_date = models.DateTimeField()


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


class blocked_hospitals(models.Model):
    manager = models.ForeignKey(manager, on_delete=models.CASCADE)
    hospital = models.ForeignKey(hospital, on_delete=models.CASCADE)


class blocked_organizations(models.Model):
    manager = models.ForeignKey(manager, on_delete=models.CASCADE)
    organ = models.ForeignKey(organization, on_delete=models.CASCADE)


class blocked_users(models.Model):
    manager = models.ForeignKey(manager, on_delete=models.CASCADE)
    user = models.ForeignKey(user, on_delete=models.CASCADE)

class comments(models.Model):
    comment = models.TextField(null=False)
    role = models.IntegerField(null=False)
    to_whom_id_doctor = models.ForeignKey(doctor,blank=True,null=True, on_delete=models.CASCADE)
    to_whom_id_hospital = models.ForeignKey(hospital, blank=True, null=True, on_delete=models.CASCADE)
    to_whom_id_pharmacy = models.ForeignKey(organization, blank=True, null=True, on_delete=models.CASCADE)
    comment_date = models.DateTimeField(auto_now=False, auto_now_add=True)
    user_foreign_key = models.ForeignKey(patient,on_delete=models.CASCADE)

