from django.shortcuts import render
from django.http import HttpResponse
from web_app.models import Voter

def index(request):
    #return HttpResponse("<h1>HELLO</h1>")
    return render(request, 'web_app/vote.html')

def create_voter(params):
    voter = Voter(name = params['name'], age = params['age'], gender = params['gender'], email_id = params['email_id'], password = params['password'], aadhar_num = params['aadhar_num'], contact_num = params['contact_num'], father_name = params['father_name'], mother_name = params['mother_name'], permanent_address = params['permanent_address'], photograph_image_link = params['photograph_image_link'], signature_image_link = params['signature_image_link'], aadhar_doc_link = params['aadhar_doc_link'], occupation = params['occupation'], date_of_birth = params['date_of_birth'])
    voter.save()
