#!/bin/bash
# Script para ejecutar el backend (Django con MySQL) en Linux
# Ejecutar desde la carpeta gestion_alumnos_api

echo "=== Iniciando Backend Django con MySQL ==="
echo "IMPORTANTE: Asegúrate de que MySQL esté corriendo"
echo "Activando entorno virtual..."

# Activar entorno virtual (ajustar ruta según tu configuración)
if [ -f "../.venv/bin/activate" ]; then
    source ../.venv/bin/activate
elif [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
elif [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
else
    echo "⚠️  No se encontró entorno virtual. Asegúrate de tenerlo configurado."
    echo "Continuando sin entorno virtual..."
fi

echo "Verificando dependencias..."
pip install -r ../requirements.txt

echo "Aplicando migraciones..."
python manage.py migrate

echo "Creando datos de prueba..."
python crear_datos_prueba.py

echo ""
echo "Iniciando servidor Django en http://127.0.0.1:8000/"
echo "API disponible en: http://127.0.0.1:8000/api/alumnos/"
echo "Admin disponible en: http://127.0.0.1:8000/admin/"
echo ""
echo "IMPORTANTE: En otra terminal ejecuta './run-frontend.sh' para el frontend"
echo ""

python manage.py runserver