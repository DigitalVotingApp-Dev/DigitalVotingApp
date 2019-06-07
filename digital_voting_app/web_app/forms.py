from django import forms
from .models import Voter
import phonenumbers
from phonenumbers import NumberParseException
#from bootstrap_datepicker_plus import DatePickerInput

class BootstrapInput(forms.TextInput):
    def __init__(self, placeholder, size=12, *args, **kwargs):
        self.size = size
        super(BootstrapInput, self).__init__(attrs={
            'class': 'form-control input-sm',
            'placeholder': placeholder
        })

    def bootwrap_input(self, input_tag):
        classes = 'col-xs-{n} col-sm-{n} col-md-{n}'.format(n=self.size)

        return '''<div class="{classes}">
                    <div class="form-group">{input_tag}</div>
                  </div>
               '''.format(classes=classes, input_tag=input_tag)

    def render(self, *args, **kwargs):
        input_tag = super(BootstrapInput, self).render(*args, **kwargs)
        return self.bootwrap_input(input_tag)


class VoterRegistrationForm(forms.Form):
 	CONS_LIST = [('', ''), ('Araku', 'Araku'), ('Srikakulam', 'Srikakulam'), ('Vizianagaram', 'Vizianagaram'), ('Visakhapatnam', 'Visakhapatnam'), ('Anakapalli', 'Anakapalli'), ('Kakinada', 'Kakinada'), ('Amalapuram', 'Amalapuram'), ('Rajahmundry', 'Rajahmundry'), ('Narasapuram', 'Narasapuram'), ('Eluru', 'Eluru'), ('Machilipatnam', 'Machilipatnam'), ('Vijayawada', 'Vijayawada'), ('Guntur', 'Guntur'), ('Narasaraopet', 'Narasaraopet'), ('Bapatla', 'Bapatla'), ('Ongole', 'Ongole'), ('Nandyal', 'Nandyal'), ('Kurnool', 'Kurnool'), ('Anantapur', 'Anantapur'), ('Hindupur', 'Hindupur'), ('Kadapa', 'Kadapa'), ('Nellore', 'Nellore'), ('Tirupati', 'Tirupati'), ('Rajampet', 'Rajampet'), ('Chittoor', 'Chittoor'), ('', ''), ('Arunachal West', 'Arunachal West'), ('Arunachal East', 'Arunachal East'), ('', ''), ('Karimganj', 'Karimganj'), ('Silchar', 'Silchar'), ('Autonomous District', 'Autonomous District'), ('Dhubri', 'Dhubri'), ('Kokrajhar', 'Kokrajhar'), ('Barpeta', 'Barpeta'), ('Gauhati', 'Gauhati'), ('Mangaldoi', 'Mangaldoi'), ('Tezpur', 'Tezpur'), ('Nowgong', 'Nowgong'), ('Kaliabor', 'Kaliabor'), ('Jorhat', 'Jorhat'), ('Dibrugarh', 'Dibrugarh'), ('Lakhimpur', 'Lakhimpur'), ('', ''), ('Valmiki Nagar', 'Valmiki Nagar'), ('Paschim Champaran', 'Paschim Champaran'), ('Purvi Champaran', 'Purvi Champaran'), ('Sheohar', 'Sheohar'), ('Sitamarhi', 'Sitamarhi'), ('Madhubani', 'Madhubani'), ('Jhanjharpur', 'Jhanjharpur'), ('Supaul', 'Supaul'), ('Araria', 'Araria'), ('Kishanganj', 'Kishanganj'), ('Katihar', 'Katihar'), ('Purnia', 'Purnia'), ('Madhepura', 'Madhepura'), ('Darbhanga', 'Darbhanga'), ('Muzaffarpur', 'Muzaffarpur'), ('Vaishali', 'Vaishali'), ('Gopalganj', 'Gopalganj'), ('Siwan', 'Siwan'), ('Maharajganj', 'Maharajganj'), ('Saran', 'Saran'), ('Hajipur', 'Hajipur'), ('Ujiarpur', 'Ujiarpur'), ('Samastipur', 'Samastipur'), ('Begusarai', 'Begusarai'), ('Khagaria', 'Khagaria'), ('Bhagalpur', 'Bhagalpur'), ('Banka', 'Banka'), ('Munger', 'Munger'), ('Nalanda', 'Nalanda'), ('Patna Sahib', 'Patna Sahib'), ('Pataliputra', 'Pataliputra'), ('Arrah', 'Arrah'), ('Buxar', 'Buxar'), ('Sasaram', 'Sasaram'), ('Karakat', 'Karakat'), ('Jahanabad', 'Jahanabad'), ('Aurangabad', 'Aurangabad'), ('Gaya', 'Gaya'), ('Nawada', 'Nawada'), ('Jamui', 'Jamui'), ('', ''), ('Sarguja', 'Sarguja'), ('Raigarh', 'Raigarh'), ('Janjgir', 'Janjgir'), ('Korba', 'Korba'), ('Bilaspur', 'Bilaspur'), ('Rajnandgaon', 'Rajnandgaon'), ('Durg', 'Durg'), ('Raipur', 'Raipur'), ('Mahasamund', 'Mahasamund'), ('Bastar', 'Bastar'), ('Kanker', 'Kanker'), ('', ''), ('North Goa', 'North Goa'), ('South Goa', 'South Goa'), ('', ''), ('Kachchh', 'Kachchh'), ('Banaskantha', 'Banaskantha'), ('Patan', 'Patan'), ('Mahesana', 'Mahesana'), ('Sabarkantha', 'Sabarkantha'), ('Gandhinagar', 'Gandhinagar'), ('Ahmedabad East', 'Ahmedabad East'), ('Ahmedabad West', 'Ahmedabad West'), ('Surendranagar', 'Surendranagar'), ('Rajkot', 'Rajkot'), ('Porbandar', 'Porbandar'), ('Jamnagar', 'Jamnagar'), ('Junagadh', 'Junagadh'), ('Amreli', 'Amreli'), ('Bhavnagar', 'Bhavnagar'), ('Anand', 'Anand'), ('Kheda', 'Kheda'), ('Panchmahal', 'Panchmahal'), ('Dahod', 'Dahod'), ('Vadodara', 'Vadodara'), ('Chhota Udaipur', 'Chhota Udaipur'), ('Bharuch', 'Bharuch'), ('Bardoli', 'Bardoli'), ('Surat', 'Surat'), ('Navsari', 'Navsari'), ('Valsad', 'Valsad'), ('', ''), ('Ambala', 'Ambala'), ('Kurukshetra', 'Kurukshetra'), ('Sirsa', 'Sirsa'), ('Hissar', 'Hissar'), ('Karnal', 'Karnal'), ('Sonipat', 'Sonipat'), ('Rohtak', 'Rohtak'), ('Bhiwani-Mahendragarh', 'Bhiwani-Mahendragarh'), ('Gurgaon', 'Gurgaon'), ('Faridabad', 'Faridabad'), ('', ''), ('Kangra', 'Kangra'), ('Mandi', 'Mandi'), ('Hamirpur', 'Hamirpur'), ('Shimla', 'Shimla'), ('', ''), ('Baramulla', 'Baramulla'), ('Srinagar', 'Srinagar'), ('Anantnag', 'Anantnag'), ('Ladakh', 'Ladakh'), ('Udhampur', 'Udhampur'), ('Jammu', 'Jammu'), ('', ''), ('Rajmahal', 'Rajmahal'), ('Dumka', 'Dumka'), ('Godda', 'Godda'), ('Chatra', 'Chatra'), ('Kodarma', 'Kodarma'), ('Giridih', 'Giridih'), ('Dhanbad', 'Dhanbad'), ('Ranchi', 'Ranchi'), ('Jamshedpur', 'Jamshedpur'), ('Singhbhum', 'Singhbhum'), ('Khunti', 'Khunti'), ('Lohardaga', 'Lohardaga'), ('Palamau', 'Palamau'), ('Hazaribagh', 'Hazaribagh'), ('', ''), ('Chikkodi', 'Chikkodi'), ('Belagavi', 'Belagavi'), ('Bagalkot', 'Bagalkot'), ('Bijapur', 'Bijapur'), ('Kalaburagi', 'Kalaburagi'), ('Raichur', 'Raichur'), ('Bidar', 'Bidar'), ('Koppal', 'Koppal'), ('Bellary', 'Bellary'), ('Haveri', 'Haveri'), ('Dharwad', 'Dharwad'), ('Uttara Kannada', 'Uttara Kannada'), ('Davanagere', 'Davanagere'), ('Shimoga', 'Shimoga'), ('Udupi Chikmagalur', 'Udupi Chikmagalur'), ('Hassan', 'Hassan'), ('Dakshina Kannada', 'Dakshina Kannada'), ('Chitradurga', 'Chitradurga'), ('Tumkur', 'Tumkur'), ('Mandya', 'Mandya'), ('Mysore', 'Mysore'), ('Chamarajanagar', 'Chamarajanagar'), ('Bangalore Rural', 'Bangalore Rural'), ('Bangalore North', 'Bangalore North'), ('Bangalore Central', 'Bangalore Central'), ('Bangalore South', 'Bangalore South'), ('Chikballapur', 'Chikballapur'), ('Kolar', 'Kolar'), ('', ''), ('Kasaragod', 'Kasaragod'), ('Kannur', 'Kannur'), ('Vatakara', 'Vatakara'), ('Wayanad', 'Wayanad'), ('Kozhikode', 'Kozhikode'), ('Malappuram', 'Malappuram'), ('Ponnani', 'Ponnani'), ('Palakkad', 'Palakkad'), ('Alathur', 'Alathur'), ('Thrissur', 'Thrissur'), ('Chalakudy', 'Chalakudy'), ('Ernakulam', 'Ernakulam'), ('Idukki', 'Idukki'), ('Kottayam', 'Kottayam'), ('Alappuzha', 'Alappuzha'), ('Mavelikara', 'Mavelikara'), ('Pathanamthitta', 'Pathanamthitta'), ('Kollam', 'Kollam'), ('Attingal', 'Attingal'), ('Thiruvananthapuram', 'Thiruvananthapuram'), ('', ''), ('Morena', 'Morena'), ('Bhind', 'Bhind'), ('Gwalior', 'Gwalior'), ('Guna', 'Guna'), ('Sagar', 'Sagar'), ('Tikamgarh', 'Tikamgarh'), ('Damoh', 'Damoh'), ('Khajuraho', 'Khajuraho'), ('Satna', 'Satna'), ('Rewa', 'Rewa'), ('Sidhi', 'Sidhi'), ('Shahdol', 'Shahdol'), ('Jabalpur', 'Jabalpur'), ('Mandla', 'Mandla'), ('Balaghat', 'Balaghat'), ('Chhindwara', 'Chhindwara'), ('Hoshangabad', 'Hoshangabad'), ('Vidisha', 'Vidisha'), ('Bhopal', 'Bhopal'), ('Rajgarh', 'Rajgarh'), ('Dewas', 'Dewas'), ('Ujjain', 'Ujjain'), ('Mandsaur', 'Mandsaur'), ('Ratlam', 'Ratlam'), ('Dhar', 'Dhar'), ('Indore', 'Indore'), ('Khargone', 'Khargone'), ('Khandwa', 'Khandwa'), ('Betul', 'Betul'), ('', ''), ('Nandurbar', 'Nandurbar'), ('Dhule', 'Dhule'), ('Jalgaon', 'Jalgaon'), ('Raver', 'Raver'), ('Buldhana', 'Buldhana'), ('Akola', 'Akola'), ('Amravati', 'Amravati'), ('Wardha', 'Wardha'), ('Ramtek', 'Ramtek'), ('Nagpur', 'Nagpur'), ('Bhandara-Gondiya', 'Bhandara-Gondiya'), ('Gadchiroli-Chimur', 'Gadchiroli-Chimur'), ('Chandrapur', 'Chandrapur'), ('Yavatmal-Washim', 'Yavatmal-Washim'), ('Hingoli', 'Hingoli'), ('Nanded', 'Nanded'), ('Parbhani', 'Parbhani'), ('Jalna', 'Jalna'), ('Aurangabad', 'Aurangabad'), ('Dindori', 'Dindori'), ('Nashik', 'Nashik'), ('Palghar', 'Palghar'), ('Bhiwandi', 'Bhiwandi'), ('Kalyan', 'Kalyan'), ('Thane', 'Thane'), ('Mumbai North', 'Mumbai North'), ('Mumbai North West', 'Mumbai North West'), ('Mumbai North East', 'Mumbai North East'), ('Mumbai North Central', 'Mumbai North Central'), ('Mumbai South Central', 'Mumbai South Central'), ('Mumbai South', 'Mumbai South'), ('Raigad', 'Raigad'), ('Maval', 'Maval'), ('Pune', 'Pune'), ('Baramati', 'Baramati'), ('Shirur', 'Shirur'), ('Ahmednagar', 'Ahmednagar'), ('Shirdi', 'Shirdi'), ('Beed', 'Beed'), ('Osmanabad', 'Osmanabad'), ('Latur', 'Latur'), ('Solapur', 'Solapur'), ('Madha', 'Madha'), ('Sangli', 'Sangli'), ('Satara', 'Satara'), ('Ratnagiri-Sindhudurg', 'Ratnagiri-Sindhudurg'), ('Kolhapur', 'Kolhapur'), ('Hatkanangle', 'Hatkanangle'), ('', ''), ('Inner Manipur', 'Inner Manipur'), ('Outer Manipur', 'Outer Manipur'), ('', ''), ('Shillong', 'Shillong'), ('Tura', 'Tura'), ('', ''), ('Mizoram', 'Mizoram'), ('', ''), ('Nagaland', 'Nagaland'), ('', ''), ('Bargarh', 'Bargarh'), ('Sundargarh', 'Sundargarh'), ('Sambalpur', 'Sambalpur'), ('Keonjhar', 'Keonjhar'), ('Mayurbhanj', 'Mayurbhanj'), ('Balasore', 'Balasore'), ('Bhadrak', 'Bhadrak'), ('Jajpur', 'Jajpur'), ('Dhenkanal', 'Dhenkanal'), ('Bolangir', 'Bolangir'), ('Kalahandi', 'Kalahandi'), ('Nabarangpur', 'Nabarangpur'), ('Kandhamal', 'Kandhamal'), ('Cuttack', 'Cuttack'), ('Kendrapara', 'Kendrapara'), ('Jagatsinghpur', 'Jagatsinghpur'), ('Puri', 'Puri'), ('Bhubaneswar', 'Bhubaneswar'), ('Aska', 'Aska'), ('Berhampur', 'Berhampur'), ('Koraput', 'Koraput'), ('', ''), ('Gurdaspur', 'Gurdaspur'), ('Amritsar', 'Amritsar'), ('Khadoor Sahib', 'Khadoor Sahib'), ('Jalandhar', 'Jalandhar'), ('Hoshiarpur', 'Hoshiarpur'), ('Anandpur Sahib', 'Anandpur Sahib'), ('Ludhiana', 'Ludhiana'), ('Fatehgarh Sahib', 'Fatehgarh Sahib'), ('Faridkot', 'Faridkot'), ('Firozpur', 'Firozpur'), ('Bathinda', 'Bathinda'), ('Sangrur', 'Sangrur'), ('Patiala', 'Patiala'), ('', ''), ('Ganganagar', 'Ganganagar'), ('Bikaner', 'Bikaner'), ('Churu', 'Churu'), ('Jhunjhunu', 'Jhunjhunu'), ('Sikar', 'Sikar'), ('Jaipur Rural', 'Jaipur Rural'), ('Jaipur', 'Jaipur'), ('Alwar', 'Alwar'), ('Bharatpur', 'Bharatpur'), ('Karauli-Dholpur', 'Karauli-Dholpur'), ('Dausa', 'Dausa'), ('Tonk-Sawai Madhopur', 'Tonk-Sawai Madhopur'), ('Ajmer', 'Ajmer'), ('Nagaur', 'Nagaur'), ('Pali', 'Pali'), ('Jodhpur', 'Jodhpur'), ('Barmer', 'Barmer'), ('Jalore', 'Jalore'), ('Udaipur', 'Udaipur'), ('Banswara', 'Banswara'), ('Chittorgarh', 'Chittorgarh'), ('Rajsamand', 'Rajsamand'), ('Bhilwara', 'Bhilwara'), ('Kota', 'Kota'), ('Jhalawar-Baran', 'Jhalawar-Baran'), ('', ''), ('Sikkim', 'Sikkim'), ('', ''), ('Thiruvallur', 'Thiruvallur'), ('Chennai North', 'Chennai North'), ('Chennai South', 'Chennai South'), ('Chennai Central', 'Chennai Central'), ('Sriperumbudur', 'Sriperumbudur'), ('Kancheepuram', 'Kancheepuram'), ('Arakkonam', 'Arakkonam'), ('Vellore', 'Vellore'), ('Krishnagiri', 'Krishnagiri'), ('Dharmapuri', 'Dharmapuri'), ('Tiruvannamalai', 'Tiruvannamalai'), ('Arani', 'Arani'), ('Villupuram', 'Villupuram'), ('Kallakurichi', 'Kallakurichi'), ('Salem', 'Salem'), ('Namakkal', 'Namakkal'), ('Erode', 'Erode'), ('Tiruppur', 'Tiruppur'), ('Nilgiris', 'Nilgiris'), ('Coimbatore', 'Coimbatore'), ('Pollachi', 'Pollachi'), ('Dindigul', 'Dindigul'), ('Karur', 'Karur'), ('Tiruchirappalli', 'Tiruchirappalli'), ('Perambalur', 'Perambalur'), ('Cuddalore', 'Cuddalore'), ('Chidambaram', 'Chidambaram'), ('Mayiladuturai', 'Mayiladuturai'), ('Nagapattinam', 'Nagapattinam'), ('Thanjavur', 'Thanjavur'), ('Sivaganga', 'Sivaganga'), ('Madurai', 'Madurai'), ('Theni', 'Theni'), ('Virudhunagar', 'Virudhunagar'), ('Ramanathapuram', 'Ramanathapuram'), ('Thoothukudi', 'Thoothukudi'), ('Tenkasi', 'Tenkasi'), ('Tirunelveli', 'Tirunelveli'), ('Kanyakumari', 'Kanyakumari'), ('', ''), ('Adilabad', 'Adilabad'), ('Peddapalle', 'Peddapalle'), ('Karimnagar', 'Karimnagar'), ('Nizamabad', 'Nizamabad'), ('Zahirabad', 'Zahirabad'), ('Medak', 'Medak'), ('Malkajgiri', 'Malkajgiri'), ('Secunderabad', 'Secunderabad'), ('Hyderabad', 'Hyderabad'), ('Chevella', 'Chevella'), ('Mahbubnagar', 'Mahbubnagar'), ('Nagarkurnool', 'Nagarkurnool'), ('Nalgonda', 'Nalgonda'), ('Bhongir', 'Bhongir'), ('Warangal', 'Warangal'), ('Mahabubabad', 'Mahabubabad'), ('Khammam', 'Khammam'), ('', ''), ('Tripura West', 'Tripura West'), ('Tripura East', 'Tripura East'), ('', ''), ('Saharanpur', 'Saharanpur'), ('Kairana', 'Kairana'), ('Muzaffarnagar', 'Muzaffarnagar'), ('Bijnor', 'Bijnor'), ('Nagina', 'Nagina'), ('Moradabad', 'Moradabad'), ('Rampur', 'Rampur'), ('Sambhal', 'Sambhal'), ('Amroha', 'Amroha'), ('Meerut', 'Meerut'), ('Baghpat', 'Baghpat'), ('Ghaziabad', 'Ghaziabad'), ('Gautam Buddha Nagar', 'Gautam Buddha Nagar'), ('Bulandshahr', 'Bulandshahr'), ('Aligarh', 'Aligarh'), ('Hathras', 'Hathras'), ('Mathura', 'Mathura'), ('Agra', 'Agra'), ('Fatehpur Sikri', 'Fatehpur Sikri'), ('Firozabad', 'Firozabad'), ('Mainpuri', 'Mainpuri'), ('Etah', 'Etah'), ('Badaun', 'Badaun'), ('Aonla', 'Aonla'), ('Bareilly', 'Bareilly'), ('Pilibhit', 'Pilibhit'), ('Shahjahanpur', 'Shahjahanpur'), ('Kheri', 'Kheri'), ('Dhaurahra', 'Dhaurahra'), ('Sitapur', 'Sitapur'), ('Hardoi', 'Hardoi'), ('Misrikh', 'Misrikh'), ('Unnao', 'Unnao'), ('Mohanlalganj', 'Mohanlalganj'), ('Lucknow', 'Lucknow'), ('Rae Bareli', 'Rae Bareli'), ('Amethi', 'Amethi'), ('Sultanpur', 'Sultanpur'), ('Pratapgarh', 'Pratapgarh'), ('Farrukhabad', 'Farrukhabad'), ('Etawah', 'Etawah'), ('Kannauj', 'Kannauj'), ('Kanpur Urban', 'Kanpur Urban'), ('Akbarpur', 'Akbarpur'), ('Jalaun', 'Jalaun'), ('Jhansi', 'Jhansi'), ('Hamirpur', 'Hamirpur'), ('Banda', 'Banda'), ('Fatehpur', 'Fatehpur'), ('Kaushambi', 'Kaushambi'), ('Phulpur', 'Phulpur'), ('Allahabad', 'Allahabad'), ('Barabanki', 'Barabanki'), ('Faizabad', 'Faizabad'), ('Ambedkar Nagar', 'Ambedkar Nagar'), ('Bahraich', 'Bahraich'), ('Kaiserganj', 'Kaiserganj'), ('Shrawasti', 'Shrawasti'), ('Gonda', 'Gonda'), ('Domariyaganj', 'Domariyaganj'), ('Basti', 'Basti'), ('Sant Kabir Nagar', 'Sant Kabir Nagar'), ('Maharajganj', 'Maharajganj'), ('Gorakhpur', 'Gorakhpur'), ('Kushi Nagar', 'Kushi Nagar'), ('Deoria', 'Deoria'), ('Bansgaon', 'Bansgaon'), ('Lalganj', 'Lalganj'), ('Azamgarh', 'Azamgarh'), ('Ghosi', 'Ghosi'), ('Salempur', 'Salempur'), ('Ballia', 'Ballia'), ('Jaunpur', 'Jaunpur'), ('Machhlishahr', 'Machhlishahr'), ('Ghazipur', 'Ghazipur'), ('Chandauli', 'Chandauli'), ('Varanasi', 'Varanasi'), ('Bhadohi', 'Bhadohi'), ('Mirzapur', 'Mirzapur'), ('Robertsganj', 'Robertsganj'), ('', ''), ('Tehri Garhwal', 'Tehri Garhwal'), ('Garhwal', 'Garhwal'), ('Almora', 'Almora'), ('Nainital-Udhamsingh Nagar', 'Nainital-Udhamsingh Nagar'), ('Haridwar', 'Haridwar'), ('', ''), ('Cooch Behar', 'Cooch Behar'), ('Alipurduars', 'Alipurduars'), ('Jalpaiguri', 'Jalpaiguri'), ('Darjeeling', 'Darjeeling'), ('Raiganj', 'Raiganj'), ('Balurghat', 'Balurghat'), ('Maldaha Uttar', 'Maldaha Uttar'), ('Maldaha Dakshin', 'Maldaha Dakshin'), ('Jangipur', 'Jangipur'), ('Baharampur', 'Baharampur'), ('Murshidabad', 'Murshidabad'), ('Krishnanagar', 'Krishnanagar'), ('Ranaghat', 'Ranaghat'), ('Bangaon', 'Bangaon'), ('Barrackpur', 'Barrackpur'), ('Dum Dum', 'Dum Dum'), ('Barasat', 'Barasat'), ('Basirhat', 'Basirhat'), ('Jaynagar', 'Jaynagar'), ('Mathurapur', 'Mathurapur'), ('Diamond Harbour', 'Diamond Harbour'), ('Jadavpur', 'Jadavpur'), ('Kolkata Dakshin', 'Kolkata Dakshin'), ('Kolkata Uttar', 'Kolkata Uttar'), ('Howrah', 'Howrah'), ('Uluberia', 'Uluberia'), ('Srerampur', 'Srerampur'), ('Hooghly', 'Hooghly'), ('Arambag', 'Arambag'), ('Tamluk', 'Tamluk'), ('Kanthi', 'Kanthi'), ('Ghatal', 'Ghatal'), ('Jhargram', 'Jhargram'), ('Medinipur', 'Medinipur'), ('Purulia', 'Purulia'), ('Bankura', 'Bankura'), ('Bishnupur', 'Bishnupur'), ('Bardhaman Purba', 'Bardhaman Purba'), ('Bardhaman-Durgapur', 'Bardhaman-Durgapur'), ('Asansol', 'Asansol'), ('Bolpur', 'Bolpur'), ('Birbhum', 'Birbhum')]
 	name = forms.CharField(max_length = 200, label = 'Name', required = True, widget=forms.TextInput(attrs={'placeholder': 'Enter full name'}))
 	email_id = forms.EmailField(label = 'Email', required = True, widget=forms.TextInput(attrs={'placeholder': 'abc@example.com'}))
 	password = forms.CharField(max_length = 60, label = 'Password', widget=forms.PasswordInput, required = True)
 	confirm_password = forms.CharField(max_length = 60, label = 'Confirm Password', widget=forms.PasswordInput, required = True)
 	aadhar_num = forms.CharField(max_length = 12, label = 'Aadhar Number', required = True, widget=forms.TextInput(attrs={'placeholder': 'Enter twelve digit aadhar number.'}))
 	contact_num = forms.CharField(max_length = 10, label = 'Contact Number', required = True)
 	gender = forms.ChoiceField(label = 'Gender', required = True, choices = [("", ""), ("M", "MALE"), ("F", "FEMALE")])
 	age = forms.ChoiceField(label = 'Age', required = True, choices = [(age, age) for age in range(18, 130)])
 	father_name = forms.CharField(max_length = 200, label = 'Father\'s Name', required = True)
 	mother_name = forms.CharField(max_length = 200, label = 'Mother\'s Name', required = True)
 	permanent_address_line_1 = forms.CharField(label = 'Permanent Address Line 1', required = True)
 	permanent_address_line_2 = forms.CharField(label = 'Permanent Address Line 2')
 	#date_of_birth = forms.DateField(label = 'Date of Birth', widget=forms.DateInput(attrs={'class': 'datepicker'}, format="%Y-%m-%d"))
 	#date_of_birth = forms.DateField(label = 'Date of Birth', widget=DatePickerInput(format='%m/%d/%Y'))
 	state = forms.ChoiceField(label = 'State', required = True, choices = [('',''), ('Andhra Pradesh', 'Andhra Pradesh'), ('Arunachal Pradesh', 'Arunachal Pradesh'), ('Assam', 'Assam'), ('Bihar', 'Bihar'), ('Chattisgarh', 'Chattisgarh'), ('Goa', 'Goa'), ('Gujarat', 'Gujarat'), ('Haryana', 'Haryana'), ('Himachal Pradesh', 'Himachal Pradesh'), ('Jammu & Kashmir', 'Jammu & Kashmir'), ('Jharkhand', 'Jharkhand'), ('Karnataka', 'Karnataka'), ('Kerala', 'Kerala'), ('Madhya Pradesh', 'Madhya Pradesh'), ('Maharashtra', 'Maharashtra'), ('Manipur', 'Manipur'), ('Meghalaya', 'Meghalaya'), ('Mizoram', 'Mizoram'), ('Nagaland', 'Nagaland'), ('Odisha', 'Odisha'), ('Punjab', 'Punjab'), ('Rajasthan', 'Rajasthan'), ('Sikkim', 'Sikkim'), ('Tamil Nadu', 'Tamil Nadu'), ('Telangana', 'Telangana'), ('Tripura', 'Tripura'), ('Uttar Pradesh', 'Uttar Pradesh'), ('Uttarakhand', 'Uttarakhand'), ('West Bengal', 'West Bengal')])
 	constituency = forms.ChoiceField(choices = CONS_LIST, label = 'Constituency', required = True)
 	voter_image = forms.ImageField()

 	def __init__(self, *args, **kwargs):
 		super(VoterRegistrationForm, self).__init__(*args, **kwargs)
 		for visible in self.visible_fields():
 			visible.field.widget.attrs['class'] = 'form-control'
 			if visible.field.label == 'State':
 				visible.field.widget.attrs['onclick'] = 'onClick()'
 				visible.field.widget.attrs['onkeyup'] = 'onClick()'
 			if visible.field.label == 'Email':
 				visible.field.widget.attrs['onkeyup'] = 'validateEmail()'
 				visible.field.widget.attrs['data-toggle'] = 'tooltip'
 				visible.field.widget.attrs['title'] = 'Please enter a vaild email id'
 			if visible.field.label == 'Confirm Password':
 				visible.field.widget.attrs['onkeyup'] = 'verifyPasswordMatch()'
 			if visible.field.label == 'Contact Number':
 				visible.field.widget.attrs['onkeyup'] = 'verifyContactMatchV2()'

class LoginForm(forms.Form):
	email_id = forms.EmailField(label = 'Email', required = True, widget=forms.TextInput(attrs={'placeholder': 'abc@example.com'}))
	password = forms.CharField(max_length = 60, label = 'Password', widget=forms.PasswordInput, required = True)

class BootstrapSelect(forms.Select):
    def __init__(self, size=12, *args, **kwargs):
        self.size = size
        super(BootstrapSelect, self).__init__(attrs={
            'class': 'form-control input-sm',
        })

    def bootwrap_input(self, input_tag):
        classes = 'col-xs-{n} col-sm-{n} col-md-{n}'.format(n=self.size)

        return '''<div class="{classes}">
                    <div class="form-group">{input_tag}</div>
                  </div>
               '''.format(classes=classes, input_tag=input_tag)

    def render(self, *args, **kwargs):
        input_tag = super(BootstrapSelect, self).render(*args, **kwargs)
        return self.bootwrap_input(input_tag)


class VerificationForm(forms.Form):
    country_code = forms.CharField(
        widget=BootstrapInput('Country Code', size=3))
    phone_number = forms.CharField(
        widget=BootstrapInput('Phone Number', size=6))
    via = forms.ChoiceField(
        choices=[('sms', 'SMS'), ('call', 'Call')],
        widget=BootstrapSelect(size=3))

    def clean_country_code(self):
        country_code = self.cleaned_data['country_code']
        if not country_code.startswith('+'):
            country_code = '+' + country_code
        return country_code

    def clean(self):
        data = self.cleaned_data
        phone_number = data['country_code'] + data['phone_number']
        try:
            phone_number = phonenumbers.parse(phone_number, None)
            if not phonenumbers.is_valid_number(phone_number):
                self.add_error('phone_number', 'Invalid phone number')
        except NumberParseException as e:
            self.add_error('phone_number', e)


class TokenForm(forms.Form):
    token = forms.CharField(
        widget=BootstrapInput('Verification Token', size=6))
