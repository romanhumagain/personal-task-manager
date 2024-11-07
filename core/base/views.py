from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework import viewsets, mixins, generics
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_simplejwt.authentication import JWTAuthentication
from .serializers import UserSerializers
from django.contrib.auth.models import User
from rest_framework import status
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['id'] = user.id
        token['username'] = user.username
        token['email'] = user.email
        return token
      
class MyTokenOptainPairView(TokenObtainPairView):
  serializer_class = MyTokenObtainPairSerializer


class RegisterUserAPIView(generics.CreateAPIView):
  serializer_class = UserSerializers
  permission_classes = [AllowAny]
  authentication_classes = []
  
  def post(self, request, *args, **kwargs):
    data = request.data
    serializer = self.get_serializer(data = data)
    if serializer.is_valid():
      user = serializer.save()
      refresh = RefreshToken.for_user(user)
      refresh['id'] = user.id
      refresh['username'] = user.username
      refresh['email'] = user.email
      access_token = str(refresh.access_token)
      
      response_data = {
        'detail':'User created successfully !',
        'refresh':str(refresh),
        'access':access_token,
      }
      
      return Response(response_data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
  
  
class LoginUserAPIView(generics.CreateAPIView):
    serializer_class = UserSerializers 

    def post(self, request, *args, **kwargs):
        data = request.data
        
        username = data.get('username')
        password = data.get('password')

        if username is None or password is None:
            return Response({'message': 'Username and password are required.'}, status=status.HTTP_400_BAD_REQUEST)

        if User.objects.filter(username=username).exists():
            user = authenticate(username=username, password=password)
            if user is not None:
                return Response({'message': 'Successfully logged in!'}, status=status.HTTP_200_OK)
            return Response({'message': 'Invalid credentials!'}, status=status.HTTP_401_UNAUTHORIZED)
        
        return Response({'message': 'Invalid credentials!'}, status=status.HTTP_401_UNAUTHORIZED)
      
      
    
class RetrieveUserAPIView(generics.RetrieveUpdateAPIView):
  serializer_class = UserSerializers
  permission_classes = [IsAuthenticated]

  def get_object(self):
    user = self.request.user
    return user
  
  def get(self, request, *args, **kwargs):
    user = self.get_object()
    serializer = self.serializer_class(user)
    if serializer.is_valid():
      return Response(serializer.data, status=status.HTTP_200_OK)
    return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
  
  def partial_update(self, request, *args, **kwargs):
    data = request.data
    user = self.get_object()
    
    serializer = self.serializer_class(user, data=data, partial = True)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_200_OK)
    return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    
  
  
    
    
    
  
  
  



  
