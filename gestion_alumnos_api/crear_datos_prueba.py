#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
sys.path.append('.')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'gestion_alumnos_api.settings')
django.setup()

from alumnos.models import Alumno

# Crear alumnos de prueba
alumnos_prueba = [
    {
        'nombre': 'Juan Pérez',
        'numero_documento': '123456789',
        'nota1': 4.5,
        'nota2': 3.8,
        'nota3': 4.2
    },
    {
        'nombre': 'María Gómez',
        'numero_documento': '987654321',
        'nota1': 3.9,
        'nota2': 4.7,
        'nota3': 4.0
    },
    {
        'nombre': 'Carlos López',
        'numero_documento': '112233445',
        'nota1': 3.0,
        'nota2': 3.5,
        'nota3': 3.2
    }
]

print("Creando alumnos de prueba...")
for alumno_data in alumnos_prueba:
    alumno, created = Alumno.objects.get_or_create(
        numero_documento=alumno_data['numero_documento'],
        defaults=alumno_data
    )
    if created:
        print(f"✓ Creado: {alumno.nombre} - Promedio: {alumno.promedio():.2f}")
    else:
        print(f"- Ya existe: {alumno.nombre}")

print(f"\nTotal alumnos en BD: {Alumno.objects.count()}")
print("¡Listo!")
