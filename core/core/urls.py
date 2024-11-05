from django.contrib import admin
from django.urls import path, include

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from base.views import MyTokenOptainPairView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')), 
    
    path('api/token/', MyTokenOptainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
