# Script para iniciar ambos servidores automáticamente
Write-Host "Iniciando sistema completo..." -ForegroundColor Magenta

# Detener procesos existentes
Write-Host "Limpiando procesos existentes..." -ForegroundColor Yellow
Get-Process | Where-Object {$_.ProcessName -eq "node"} | Stop-Process -Force -ErrorAction SilentlyContinue
Get-Process | Where-Object {$_.ProcessName -eq "python"} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 3

# Iniciar backend Django
Write-Host "Iniciando Django backend..." -ForegroundColor Blue
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location 'C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api'; python manage.py runserver"

# Esperar
Start-Sleep -Seconds 5

# Iniciar frontend React
Write-Host "Iniciando React frontend..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location 'C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api\gestion_alumnos_frontend'; npm start"

Write-Host "Ambos servidores iniciandose..." -ForegroundColor Green
Write-Host "Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "Backend: http://127.0.0.1:8000" -ForegroundColor White
Write-Host "Espera unos segundos..." -ForegroundColor Yellow
