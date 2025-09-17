#!/bin/bash
# Script para ejecutar el frontend (React) en Linux
# Ejecutar desde la carpeta gestion_alumnos_frontend

echo "=== Iniciando Frontend React ==="
echo "Verificando dependencias..."

if [ ! -d "node_modules" ]; then
    echo "Instalando dependencias de Node.js..."
    npm install
fi

echo ""
echo "Iniciando servidor React en http://localhost:3000/"
echo ""
echo "ASEGÚRATE de que el backend Django esté corriendo en http://127.0.0.1:8000/"
echo ""

npm start