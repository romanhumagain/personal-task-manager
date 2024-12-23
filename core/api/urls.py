from django.urls import path, include
from base.views import (
        RegisterUserAPIView,
        RetrieveUserAPIView,
        LoginUserAPIView
        
      )
from task.views import (CategoryAddApiView,
                        TaskListCreateApiView, 
                        TaskRetriveDestroyApiView
                        )

urlpatterns = [
  path('register/user/', RegisterUserAPIView.as_view(), name='register_user'),
  path('user/', RetrieveUserAPIView.as_view(), name='retrieve_update_user'),
  path('login/user', LoginUserAPIView.as_view(), name='login_user'),
  
  path('category/', CategoryAddApiView.as_view(), name='add_category'),
  path('task/', TaskListCreateApiView.as_view(), name='add_get_task'),
  path('task/<int:id>/', TaskRetriveDestroyApiView.as_view(), name='get_delete_task'),
  
  
]