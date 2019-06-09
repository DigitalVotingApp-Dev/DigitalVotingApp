"""digital_voting_app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from web_app import views
from django.conf import settings
from django.conf.urls.static import static 
#from phone_verification import views as verify_views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('web_app/', include('web_app.urls')),
    url('^create_voter/', views.create_voter, name = 'login_action'),
    url('^register_voter/', views.register_voter, name = 'register_voter_action'),
    url('^login/', views.login_voter, name = 'login_voter_action'),
    url('^profile/', views.load_voter_profile, name = 'profile_voter_action'),
    url('^registration_successful/', views.prompt_login, name = 'prompt_login_action'),
    url('^verification/$', views.phone_verification, name='phone_verification'),  # noqa: E501
    url('^verification/token/$', views.token_validation, name='token_validation'),  # noqa: E501
    url('^verified/$', views.verified, name='verified'),
    url('^home/$', views.index_page, name='index_action'),
    url('^about-us/$', views.about_us_page, name='about_action'),
    url('^contact-us/$', views.contact_us_page, name = 'contact_action'),
    url('^recognize-voter/$', views.recognize_voter, name='recognize_voter_action')
]
if settings.DEBUG:
	urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
