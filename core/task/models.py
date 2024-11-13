from django.db import models
from django.contrib.auth.models import User

class Category(models.Model):
  user = models.ForeignKey(User, on_delete= models.CASCADE, related_name='categories')
  category = models.CharField(max_length=100, unique= True)
  
  def __str__(self):
    return f"{self.user.username}'s {self.category}"
   

class Task(models.Model):
  user = models.ForeignKey(User, on_delete= models.CASCADE, related_name='todos')
  title = models.CharField(max_length=200)
  description = models.TextField(null=True, blank=True)
  category = models.ForeignKey(Category, on_delete=models.CASCADE)
  priority = models.CharField(max_length=100)
  date = models.DateField()
  time = models.TimeField()
  is_completed = models.BooleanField(default=False)
  
  def __str__(self):
    return f"{self.user.username}'s {self.title}"

