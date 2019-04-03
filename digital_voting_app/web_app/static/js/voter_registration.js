function onClick() {
		    var cons_list = {"Andhra Pradesh": ['','Araku', 'Srikakulam', 'Vizianagaram', 'Visakhapatnam', 'Anakapalli', 'Kakinada', 'Amalapuram', 'Rajahmundry', 'Narasapuram', 'Eluru', 'Machilipatnam', 'Vijayawada', 'Guntur', 'Narasaraopet', 'Bapatla', 'Ongole', 'Nandyal', 'Kurnool', 'Anantapur', 'Hindupur', 'Kadapa', 'Nellore', 'Tirupati', 'Rajampet', 'Chittoor'],
	    "Arunachal Pradesh": ['','Arunachal West', 'Arunachal East'],
	    "Assam": ['', 'Karimganj', 'Silchar', 'Autonomous District', 'Dhubri', 'Kokrajhar', 'Barpeta', 'Gauhati', 'Mangaldoi', 'Tezpur', 'Nowgong', 'Kaliabor', 'Jorhat', 'Dibrugarh', 'Lakhimpur'],
	    "Bihar": ['', 'Valmiki Nagar', 'Paschim Champaran', 'Purvi Champaran', 'Sheohar', 'Sitamarhi', 'Madhubani', 'Jhanjharpur', 'Supaul', 'Araria', 'Kishanganj', 'Katihar', 'Purnia', 'Madhepura', 'Darbhanga', 'Muzaffarpur', 'Vaishali', 'Gopalganj', 'Siwan', 'Maharajganj', 'Saran', 'Hajipur', 'Ujiarpur', 'Samastipur', 'Begusarai', 'Khagaria', 'Bhagalpur', 'Banka', 'Munger', 'Nalanda', 'Patna Sahib', 'Pataliputra', 'Arrah', 'Buxar', 'Sasaram', 'Karakat', 'Jahanabad', 'Aurangabad', 'Gaya', 'Nawada', 'Jamui'],
	    "Chattisgarh": ['', 'Sarguja', 'Raigarh', 'Janjgir', 'Korba', 'Bilaspur', 'Rajnandgaon', 'Durg', 'Raipur', 'Mahasamund', 'Bastar', 'Kanker'], 
	    "Goa": ['', 'North Goa', 'South Goa'], 
	    "Gujarat": ['', 'Kachchh', 'Banaskantha', 'Patan', 'Mahesana', 'Sabarkantha', 'Gandhinagar', 'Ahmedabad East', 'Ahmedabad West', 'Surendranagar', 'Rajkot', 'Porbandar', 'Jamnagar', 'Junagadh', 'Amreli', 'Bhavnagar', 'Anand', 'Kheda', 'Panchmahal', 'Dahod', 'Vadodara', 'Chhota Udaipur', 'Bharuch', 'Bardoli', 'Surat', 'Navsari', 'Valsad'], 
	    "Haryana": ['', 'Ambala', 'Kurukshetra', 'Sirsa', 'Hissar', 'Karnal', 'Sonipat', 'Rohtak', 'Bhiwani–Mahendragarh', 'Gurgaon', 'Faridabad'],
	    "Himachal Pradesh": ['', 'Kangra', 'Mandi', 'Hamirpur', 'Shimla'],
	    "Jammu & Kashmir": ['', 'Baramulla', 'Srinagar', 'Anantnag', 'Ladakh', 'Udhampur', 'Jammu'], 
	    "Jharkhand": ['', 'Rajmahal', 'Dumka', 'Godda', 'Chatra', 'Kodarma', 'Giridih', 'Dhanbad', 'Ranchi', 'Jamshedpur', 'Singhbhum', 'Khunti', 'Lohardaga', 'Palamau', 'Hazaribagh'], 
	    "Karnataka": ['', 'Chikkodi', 'Belagavi', 'Bagalkot', 'Bijapur', 'Kalaburagi', 'Raichur', 'Bidar', 'Koppal', 'Bellary', 'Haveri', 'Dharwad', 'Uttara Kannada', 'Davanagere', 'Shimoga', 'Udupi Chikmagalur', 'Hassan', 'Dakshina Kannada', 'Chitradurga', 'Tumkur', 'Mandya', 'Mysore', 'Chamarajanagar', 'Bangalore Rural', 'Bangalore North', 'Bangalore Central', 'Bangalore South', 'Chikballapur', 'Kolar'], 
	    "Kerala": ['', 'Kasaragod', 'Kannur', 'Vatakara', 'Wayanad', 'Kozhikode', 'Malappuram', 'Ponnani', 'Palakkad', 'Alathur', 'Thrissur', 'Chalakudy', 'Ernakulam', 'Idukki', 'Kottayam', 'Alappuzha', 'Mavelikara', 'Pathanamthitta', 'Kollam', 'Attingal', 'Thiruvananthapuram'], 
	    "Madhya Pradesh": ['', 'Morena', 'Bhind', 'Gwalior', 'Guna', 'Sagar', 'Tikamgarh', 'Damoh', 'Khajuraho', 'Satna', 'Rewa', 'Sidhi', 'Shahdol', 'Jabalpur', 'Mandla', 'Balaghat', 'Chhindwara', 'Hoshangabad', 'Vidisha', 'Bhopal', 'Rajgarh', 'Dewas', 'Ujjain', 'Mandsaur', 'Ratlam', 'Dhar', 'Indore', 'Khargone', 'Khandwa', 'Betul'],
	    "Maharashtra": ['', 'Nandurbar', 'Dhule', 'Jalgaon', 'Raver', 'Buldhana', 'Akola', 'Amravati', 'Wardha', 'Ramtek', 'Nagpur', 'Bhandara–Gondiya', 'Gadchiroli–Chimur', 'Chandrapur', 'Yavatmal–Washim', 'Hingoli', 'Nanded', 'Parbhani', 'Jalna', 'Aurangabad', 'Dindori', 'Nashik', 'Palghar', 'Bhiwandi', 'Kalyan', 'Thane', 'Mumbai North', 'Mumbai North West', 'Mumbai North East', 'Mumbai North Central', 'Mumbai South Central', 'Mumbai South', 'Raigad', 'Maval', 'Pune', 'Baramati', 'Shirur', 'Ahmednagar', 'Shirdi', 'Beed', 'Osmanabad', 'Latur', 'Solapur', 'Madha', 'Sangli', 'Satara', 'Ratnagiri–Sindhudurg', 'Kolhapur', 'Hatkanangle'], 
	    "Manipur": ['', 'Inner Manipur', 'Outer Manipur'], 
	    "Meghalaya": ['', 'Shillong', 'Tura'],
	    "Mizoram": ['', 'Mizoram'],
	    "Nagaland": ['', 'Nagaland'], 
	    "Odisha": ['', 'Bargarh', 'Sundargarh', 'Sambalpur', 'Keonjhar', 'Mayurbhanj', 'Balasore', 'Bhadrak', 'Jajpur', 'Dhenkanal', 'Bolangir', 'Kalahandi', 'Nabarangpur', 'Kandhamal', 'Cuttack', 'Kendrapara', 'Jagatsinghpur', 'Puri', 'Bhubaneswar', 'Aska', 'Berhampur', 'Koraput'],
	    "Punjab": ['', 'Gurdaspur', 'Amritsar', 'Khadoor Sahib', 'Jalandhar', 'Hoshiarpur', 'Anandpur Sahib', 'Ludhiana', 'Fatehgarh Sahib', 'Faridkot', 'Firozpur', 'Bathinda', 'Sangrur', 'Patiala'],
	    "Rajasthan": ['', 'Ganganagar', 'Bikaner', 'Churu', 'Jhunjhunu', 'Sikar', 'Jaipur Rural', 'Jaipur', 'Alwar', 'Bharatpur', 'Karauli–Dholpur', 'Dausa', 'Tonk–Sawai Madhopur', 'Ajmer', 'Nagaur', 'Pali', 'Jodhpur', 'Barmer', 'Jalore', 'Udaipur', 'Banswara', 'Chittorgarh', 'Rajsamand', 'Bhilwara', 'Kota', 'Jhalawar–Baran'],
	    "Sikkim": ['', 'Sikkim'],
	    "Tamil Nadu": ['', 'Thiruvallur', 'Chennai North', 'Chennai South', 'Chennai Central', 'Sriperumbudur', 'Kancheepuram', 'Arakkonam', 'Vellore', 'Krishnagiri', 'Dharmapuri', 'Tiruvannamalai', 'Arani', 'Villupuram', 'Kallakurichi', 'Salem', 'Namakkal', 'Erode', 'Tiruppur', 'Nilgiris', 'Coimbatore', 'Pollachi', 'Dindigul', 'Karur', 'Tiruchirappalli', 'Perambalur', 'Cuddalore', 'Chidambaram', 'Mayiladuturai', 'Nagapattinam', 'Thanjavur', 'Sivaganga', 'Madurai', 'Theni', 'Virudhunagar', 'Ramanathapuram', 'Thoothukudi', 'Tenkasi', 'Tirunelveli', 'Kanyakumari'],
	    "Telangana": ['', 'Adilabad', 'Peddapalle', 'Karimnagar', 'Nizamabad', 'Zahirabad', 'Medak', 'Malkajgiri', 'Secunderabad', 'Hyderabad', 'Chevella', 'Mahbubnagar', 'Nagarkurnool', 'Nalgonda', 'Bhongir', 'Warangal', 'Mahabubabad', 'Khammam'],
	    "Tripura": ['', 'Tripura West', 'Tripura East'],
	    "Uttar Pradesh": ['', 'Saharanpur', 'Kairana', 'Muzaffarnagar', 'Bijnor', 'Nagina', 'Moradabad', 'Rampur', 'Sambhal', 'Amroha', 'Meerut', 'Baghpat', 'Ghaziabad', 'Gautam Buddha Nagar', 'Bulandshahr', 'Aligarh', 'Hathras', 'Mathura', 'Agra', 'Fatehpur Sikri', 'Firozabad', 'Mainpuri', 'Etah', 'Badaun', 'Aonla', 'Bareilly', 'Pilibhit', 'Shahjahanpur', 'Kheri', 'Dhaurahra', 'Sitapur', 'Hardoi', 'Misrikh', 'Unnao', 'Mohanlalganj', 'Lucknow', 'Rae Bareli', 'Amethi', 'Sultanpur', 'Pratapgarh', 'Farrukhabad', 'Etawah', 'Kannauj', 'Kanpur Urban', 'Akbarpur', 'Jalaun', 'Jhansi', 'Hamirpur', 'Banda', 'Fatehpur', 'Kaushambi', 'Phulpur', 'Allahabad', 'Barabanki', 'Faizabad', 'Ambedkar Nagar', 'Bahraich', 'Kaiserganj', 'Shrawasti', 'Gonda', 'Domariyaganj', 'Basti', 'Sant Kabir Nagar', 'Maharajganj', 'Gorakhpur', 'Kushi Nagar', 'Deoria', 'Bansgaon', 'Lalganj', 'Azamgarh', 'Ghosi', 'Salempur', 'Ballia', 'Jaunpur', 'Machhlishahr', 'Ghazipur', 'Chandauli', 'Varanasi', 'Bhadohi', 'Mirzapur', 'Robertsganj'], 
	    "Uttarakhand": ['', 'Tehri Garhwal', 'Garhwal', 'Almora', 'Nainital–Udhamsingh Nagar', 'Haridwar'],
	    "West Bengal": ['', 'Cooch Behar', 'Alipurduars', 'Jalpaiguri', 'Darjeeling', 'Raiganj', 'Balurghat', 'Maldaha Uttar', 'Maldaha Dakshin', 'Jangipur', 'Baharampur', 'Murshidabad', 'Krishnanagar', 'Ranaghat', 'Bangaon', 'Barrackpur', 'Dum Dum', 'Barasat', 'Basirhat', 'Jaynagar', 'Mathurapur', 'Diamond Harbour', 'Jadavpur', 'Kolkata Dakshin', 'Kolkata Uttar', 'Howrah', 'Uluberia', 'Srerampur', 'Hooghly', 'Arambag', 'Tamluk', 'Kanthi', 'Ghatal', 'Jhargram', 'Medinipur', 'Purulia', 'Bankura', 'Bishnupur', 'Bardhaman Purba', 'Bardhaman–Durgapur', 'Asansol', 'Bolpur', 'Birbhum']
	    };
	    var e = document.getElementById("id_state");
	    console.log("e=" + e);
	    var selectedState = e.options[e.selectedIndex].value;
	    console.log("selectedState = " + selectedState);
	    var f = document.getElementById("id_constituency");
	    console.log("f=" + f);
	    cons_state_list = cons_list[selectedState];
	    var i;
	    for(i = f.options.length - 1 ; i >= 0 ; i--)
	    {
	        f.remove(i);
	    }
	    var j;
	    for(j=0; j<cons_state_list.length; j++)
	    {
	      var option = document.createElement("option");
	      option.text = cons_state_list[j];
	      f.add(option);
	    }
	  }