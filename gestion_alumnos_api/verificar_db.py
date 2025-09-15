#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
sys.path.append('.')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'gestion_alumnos_api.settings')
django.setup()

from alumnos.models import Alumno
from django.db import connection

print("=== VERIFICACIÓN DE BASE DE DATOS MYSQL ===")
print(f"Motor de base de datos: {connection.vendor}")
print(f"Nombre de la base de datos: {connection.settings_dict['NAME']}")
print(f"Host: {connection.settings_dict['HOST']}")
print(f"Puerto: {connection.settings_dict['PORT']}")
print(f"Usuario: {connection.settings_dict['USER']}")

print(f"\nTotal de alumnos en la base de datos: {Alumno.objects.count()}")
print("\n=== LISTA DE ALUMNOS ===")
for alumno in Alumno.objects.all():
    print(f"ID: {alumno.id}")
    print(f"Nombre: {alumno.nombre}")
    print(f"Documento: {alumno.numero_documento}")
    print(f"Nota 1: {alumno.nota1}")
    print(f"Nota 2: {alumno.nota2}")
    print(f"Nota 3: {alumno.nota3}")
    print(f"Promedio: {alumno.promedio()}")
    print("-" * 30)

print("✅ La base de datos MySQL está conectada y funcionando correctamente!")
