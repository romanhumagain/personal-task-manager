from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework import viewsets, mixins, generics
from rest_framework.permissions import IsAuthenticated, AllowAny
from .serializers import UserSerializers
from django.contrib.auth.models import User
from rest_framework import status


class RegisterUserAPIView(generics.CreateAPIView):
  serializer_class = UserSerializers
  permission_classes = [AllowAny]
  
  def post(self, request, *args, **kwargs):
    data = request.data
    serializer = self.get_serializer(data = data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
  
class RetrieveUserAPIView(generics.RetrieveUpdateAPIView):
  serializer_class = UserSerializers

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
    
    
  
  
    
    
    
  
  
  



  
