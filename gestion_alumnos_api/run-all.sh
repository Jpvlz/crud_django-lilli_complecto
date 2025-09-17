#!/bin/bash
# Script para iniciar ambos servidores automáticamente en Linux
# Ejecutar desde la carpeta gestion_alumnos_api

echo "🚀 Iniciando sistema completo..."

# Función para limpiar procesos al salir
cleanup() {
    echo ""
    echo "🛑 Deteniendo servidores..."
    pkill -f "python manage.py runserver" 2>/dev/null
    pkill -f "react-scripts start" 2>/dev/null
    exit 0
}

# Capturar señales para limpiar al salir
trap cleanup SIGINT SIGTERM

# Detener procesos existentes
echo "🧹 Limpiando procesos existentes..."
pkill -f "python manage.py runserver" 2>/dev/null
pkill -f "react-scripts start" 2>/dev/null

sleep 2

# Verificar que estamos en el directorio correcto
if [ ! -f "manage.py" ]; then
    echo "❌ Error: No se encontró manage.py. Ejecuta este script desde la carpeta gestion_alumnos_api"
    exit 1
fi

# Verificar entorno virtual
if [ -f "../.venv/bin/activate" ]; then
    source ../.venv/bin/activate
elif [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
elif [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
fi

# Instalar dependencias Python
echo "📦 Verificando dependencias Python..."
pip install -r ../requirements.txt > /dev/null 2>&1

# Aplicar migraciones
echo "🔄 Aplicando migraciones..."
python manage.py migrate

# Crear datos de prueba
echo "📊 Creando datos de prueba..."
python crear_datos_prueba.py

# Iniciar backend Django en segundo plano
echo "🐍 Iniciando Django backend..."
python manage.py runserver > django.log 2>&1 &
DJANGO_PID=$!

# Esperar un poco para que Django se inicie
sleep 5

# Cambiar al directorio del frontend
cd gestion_alumnos_frontend

# Verificar dependencias de Node.js
echo "📦 Verificando dependencias Node.js..."
if [ ! -d "node_modules" ]; then
    echo "⬇️  Instalando dependencias de Node.js..."
    npm install
fi

# Iniciar frontend React en segundo plano
echo "⚛️  Iniciando React frontend..."
npm start > ../react.log 2>&1 &
REACT_PID=$!

# Volver al directorio principal
cd ..

echo ""
echo "✅ Ambos servidores iniciados!"
echo "🌐 Frontend: http://localhost:3000"
echo "🔗 Backend: http://127.0.0.1:8000"
echo "📡 API: http://127.0.0.1:8000/api/alumnos/"
echo "⚙️  Admin: http://127.0.0.1:8000/admin/"
echo ""
echo "📝 Logs disponibles en:"
echo "   - Django: django.log"
echo "   - React: react.log"
echo ""
echo "⏹️  Presiona Ctrl+C para detener ambos servidores"

# Mantener el script corriendo
wait $DJANGO_PID $REACT_PID