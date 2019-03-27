from django.db import models

class Voter(models.Model):

    GENDER_CHOICES = [
        ('M', 'MALE'),
        ('F', 'FEMALE'),
    ]
    name = models.CharField(max_length = 200)
    email_id = models.CharField(max_length = 20000)
    password = models.CharField(max_length = 60)
    aadhar_num = models.TextField(primary_key = True)
    contact_num = models.IntegerField()
    gender = models.CharField(max_length = 6, choices = GENDER_CHOICES)
    age = models.IntegerField()
    father_name = models.CharField(max_length = 200)
    mother_name = models.CharField(max_length = 200)
    permanent_address_line_1 = models.TextField()
    permanent_address_line_2 = models.TextField()
    photograph_image_link = models.CharField(max_length = 300)
    signature_image_link = models.CharField(max_length = 300)
    #aadhar_doc_link = models.CharField(max_length = 300)
    #occupation = models.CharField(max_length = 100)
    date_of_birth = models.DateTimeField("Date of Birth")
    #city = models.CharField(max_length = 200)
    state = models.CharField(max_length = 200)
    constituency = models.CharField(max_length = 200)

    def __str__(self):
        return self.name

    def with_aadhar_num(str):
        return Voter.objects.get(aadhar_num = str)

    def present_voter(aadhar_number):
        hash = {}
        voter = Voter.objects.get(aadhar_num = aadhar_number)
        hash['name'] = voter.name
        hash['emailId'] = voter.email_id
        hash['aadharNum'] = voter.aadhar_num
        hash['contactNum'] = voter.contact_num
        hash['gender'] = voter.gender
        hash['age'] = voter.age
        hash['fatherName'] = voter.father_name
        hash['motherName'] = voter.mother_name
        hash['occupation'] = voter.occupation
        hash['dateOfBirth'] = voter.date_of_birth
        return hash

class Constituency(models.Model):
    name = models.CharField(max_length = 200)
    city = models.CharField(max_length = 200)
    state = models.CharField(max_length = 200)
