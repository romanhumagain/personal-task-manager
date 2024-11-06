from rest_framework.serializers import ModelSerializer
from django.contrib.auth.models import User
from rest_framework import serializers

class UserSerializers(ModelSerializer):
  class Meta:
    model = User
    fields = ['id','username', 'email', 'password']
    extra_kwargs = {
      'id': {'read_only':True},
      'password': {'write_only':True}
    }
    
  def create(self, validated_data):
    user = User.objects.create(
      username = validated_data['username'],
      email = validated_data['email']
    )
    
    user.set_password(validated_data['password'])
    user.save()
    return user
  
  def validate_email(self, value):
    if User.objects.filter(email = value).exists():
      raise serializers.ValidationError("A user with this email already exists !")
    return value
  
  def validate_username(self, value):
    if User.objects.filter(username = value).exists():
      raise serializers.ValidationError("A user with this username already exists !")
    return value
  
  
    