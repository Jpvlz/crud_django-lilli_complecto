#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
sys.path.append('.')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from productos.models import Producto

# Crear productos de prueba
productos_prueba = [
    {
        'nombre': 'Laptop Gaming',
        'descripcion': 'Laptop de alta gama para videojuegos',
        'precio': 1500.00
    },
    {
        'nombre': 'Mouse Inalámbrico',
        'descripcion': 'Mouse ergonómico con conexión Bluetooth',
        'precio': 25.99
    },
    {
        'nombre': 'Teclado Mecánico',
        'descripcion': 'Teclado mecánico RGB para gaming',
        'precio': 89.99
    },
    {
        'nombre': 'Monitor 4K',
        'descripcion': 'Monitor 27 pulgadas resolución 4K',
        'precio': 399.99
    },
    {
        'nombre': 'Auriculares',
        'descripcion': 'Auriculares con cancelación de ruido',
        'precio': 199.99
    }
]

print("Creando productos de prueba...")
for producto_data in productos_prueba:
    producto, created = Producto.objects.get_or_create(
        nombre=producto_data['nombre'],
        defaults=producto_data
    )
    if created:
        print(f"✓ Creado: {producto.nombre}")
    else:
        print(f"- Ya existe: {producto.nombre}")

print(f"\nTotal productos en BD: {Producto.objects.count()}")
print("¡Listo!")
