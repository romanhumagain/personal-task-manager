from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework import viewsets, mixins, generics
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_simplejwt.authentication import JWTAuthentication
from .serializers import CategorySerializer, TaskSerializer
from django.contrib.auth.models import User
from rest_framework import status
from .models import Task, Category

class CategoryAddApiView(generics.ListCreateAPIView):
  permission_classes = [IsAuthenticated] 
  serializer_class = CategorySerializer
  
  def get(self, request, *args, **kwargs):
    category = Category.objects.filter(user = request.user)
    if category.exists():
        serializer = self.get_serializer(category, many = True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    return Response({'detail':'Category not found!'}, status=status.HTTP_204_NO_CONTENT)
  
  def post(self, request, *args, **kwargs):
    data = request.data
    user = request.user
    
    data['user'] = user.id
    serializer = self.get_serializer(data = data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status= status.HTTP_201_CREATED)    
    return Response(serializer.errors, status= status.HTTP_404_NOT_FOUND)    
  
class TaskListCreateApiView(generics.ListCreateAPIView):
  permission_classes = [IsAuthenticated]
  serializer_class = TaskSerializer
  
  def get(self, request, *args, **kwargs):
    task = Task.objects.filter(user = request.user)
    if task.exists():
      serializer = self.get_serializer(task, many = True)
      return Response(serializer.data, status=status.HTTP_200_OK)
    return Response({'detail':'Task not found!'}, status=status.HTTP_204_NO_CONTENT)
  
  def post(self, request, *args, **kwargs):
    data = request.data
    user = request.user
    
    data['user'] = user.id
    serializer = self.get_serializer(data = data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status= status.HTTP_201_CREATED)    
    return Response(serializer.errors, status= status.HTTP_404_NOT_FOUND) 
  
class TaskRetriveDestroyApiView(generics.RetrieveDestroyAPIView):
  permission_classes = [IsAuthenticated]
  serializer_class = TaskSerializer
  
  def get_object(self):
    task = Task.objects.get(id = self.kwargs.get('id'))
    return task
  
  def get(self, request, *args, **kwargs):
    task = self.get_object();
    if task is not None:
      serializer = self.get_serializer(task)
      return Response(serializer.data, status= status.HTTP_200_OK)    
    return Response({'detail':'Task details not found!'}, status=status.HTTP_204_NO_CONTENT)
    
  def delete(self, request, *args, **kwargs):
    task = self.get_object()
    if task is not None:
      task.delete()
      return Response({'detail':'Task deleted successfully!'}, status=status.HTTP_204_NO_CONTENT)
    return Response({'detail':'Task details not found!'}, status=status.HTTP_204_NO_CONTENT)
