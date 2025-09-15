# Script para ejecutar el backend (Django con MySQL)
# Ejecutar desde la carpeta gestion_alumnos_api

Write-Host "=== Iniciando Backend Django con MySQL ===" -ForegroundColor Green
Write-Host "IMPORTANTE: Asegúrate de que XAMPP MySQL esté corriendo" -ForegroundColor Red
Write-Host "Activando entorno virtual..." -ForegroundColor Yellow
& "..\\.venv\Scripts\Activate.ps1"

Write-Host "Aplicando migraciones..." -ForegroundColor Yellow
python manage.py migrate

Write-Host "Creando datos de prueba..." -ForegroundColor Yellow
python crear_datos_prueba.py

Write-Host "Iniciando servidor Django en http://127.0.0.1:8000/" -ForegroundColor Green
Write-Host "API disponible en: http://127.0.0.1:8000/api/alumnos/" -ForegroundColor Cyan
Write-Host "Admin disponible en: http://127.0.0.1:8000/admin/" -ForegroundColor Cyan
Write-Host "" -ForegroundColor White
Write-Host "IMPORTANTE: En otra terminal ejecuta 'run-frontend.ps1' para el frontend" -ForegroundColor Red
Write-Host "" -ForegroundColor White

python manage.py runserver
