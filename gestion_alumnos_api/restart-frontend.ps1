# Script para reiniciar el frontend React automáticamente
Write-Host "🔄 Reiniciando servidor React..." -ForegroundColor Yellow

# Detener procesos de Node.js
Write-Host "⏹️ Deteniendo procesos existentes..." -ForegroundColor Cyan
Get-Process | Where-Object {$_.ProcessName -eq "node"} | Stop-Process -Force -ErrorAction SilentlyContinue

# Esperar un momento
Start-Sleep -Seconds 2

# Navegar al directorio correcto
Set-Location "C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api\gestion_alumnos_frontend"

# Iniciar el servidor React
Write-Host "🚀 Iniciando servidor React..." -ForegroundColor Green
npm start
