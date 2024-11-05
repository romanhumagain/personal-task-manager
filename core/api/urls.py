from django.urls import path, include
from base.views import (
        RegisterUserAPIView,
        RetrieveUserAPIView,
        LoginUserAPIView
        
      )

urlpatterns = [
  path('register/user/', RegisterUserAPIView.as_view(), name='register_user'),
  path('user/', RetrieveUserAPIView.as_view(), name='retrieve_update_user'),
  path('login/user', LoginUserAPIView.as_view(), name='login_user'),
  
]