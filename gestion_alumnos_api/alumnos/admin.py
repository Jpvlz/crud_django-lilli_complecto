from django.contrib import admin
from .models import Alumno

@admin.register(Alumno)
class AlumnoAdmin(admin.ModelAdmin):
    list_display = ['id', 'nombre', 'numero_documento', 'nota1', 'nota2', 'nota3']
    search_fields = ['nombre', 'numero_documento']
    ordering = ['nombre']
