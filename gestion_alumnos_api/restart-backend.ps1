# Script para reiniciar el backend Django automáticamente
Write-Host "🔄 Reiniciando servidor Django..." -ForegroundColor Yellow

# Detener procesos de Python
Write-Host "⏹️ Deteniendo procesos Django existentes..." -ForegroundColor Cyan
Get-Process | Where-Object {$_.ProcessName -eq "python"} | Stop-Process -Force -ErrorAction SilentlyContinue

# Esperar un momento
Start-Sleep -Seconds 2

# Navegar al directorio correcto
Set-Location "C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api"

# Iniciar el servidor Django
Write-Host "🚀 Iniciando servidor Django..." -ForegroundColor Green
python manage.py runserver
