from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from alumnos.views import AlumnoViewSet


router = routers.DefaultRouter()
router.register(r'alumnos', AlumnoViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]
