# Guía de Ejecución para Linux - CRUD Django/React

## 📋 Requisitos Previos

### 1. Instalar dependencias del sistema:
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install python3 python3-pip python3-venv nodejs npm mysql-server

# CentOS/RHEL/Rocky Linux
sudo yum install python3 python3-pip nodejs npm mysql-server
# o en versiones más nuevas:
sudo dnf install python3 python3-pip nodejs npm mysql-server

# Arch Linux
sudo pacman -S python python-pip nodejs npm mysql
```

### 2. Configurar MySQL:
```bash
# Iniciar MySQL
sudo systemctl start mysql
sudo systemctl enable mysql

# Configurar MySQL (opcional, para mayor seguridad)
sudo mysql_secure_installation

# Crear base de datos (conectar como root)
mysql -u root -p
```

En MySQL, ejecutar:
```sql
CREATE DATABASE gestion_alumnos;
CREATE USER 'django_user'@'localhost' IDENTIFIED BY 'tu_password';
GRANT ALL PRIVILEGES ON gestion_alumnos.* TO 'django_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### 3. Configurar entorno virtual Python:
```bash
# Navegar al directorio del proyecto
cd /ruta/a/tu/proyecto/gestion_alumnos_api

# Crear entorno virtual
python3 -m venv .venv

# Activar entorno virtual
source .venv/bin/activate

# Instalar dependencias
pip install -r ../requirements.txt
```

### 4. Configurar permisos de scripts:
```bash
# Hacer ejecutables los scripts
chmod +x run-backend.sh
chmod +x run-all.sh
chmod +x gestion_alumnos_frontend/run-frontend.sh
```

## 🚀 Opciones de Ejecución

### Opción 1: Ejecutar todo automáticamente (Recomendado)
```bash
cd gestion_alumnos_api
./run-all.sh
```

### Opción 2: Ejecutar manualmente (terminales separadas)

#### Terminal 1 - Backend (Django):
```bash
cd gestion_alumnos_api
./run-backend.sh
```

#### Terminal 2 - Frontend (React):
```bash
cd gestion_alumnos_api/gestion_alumnos_frontend
./run-frontend.sh
```

### Opción 3: Comandos manuales paso a paso

#### Backend:
```bash
cd gestion_alumnos_api

# Activar entorno virtual
source .venv/bin/activate

# Instalar dependencias
pip install -r ../requirements.txt

# Aplicar migraciones
python manage.py migrate

# Crear datos de prueba
python crear_datos_prueba.py

# Iniciar servidor
python manage.py runserver
```

#### Frontend (en otra terminal):
```bash
cd gestion_alumnos_api/gestion_alumnos_frontend

# Instalar dependencias Node.js (solo la primera vez)
npm install

# Iniciar servidor React
npm start
```

## 🌐 URLs de Acceso

- **Frontend (React):** http://localhost:3000
- **Backend API:** http://127.0.0.1:8000/api/alumnos/
- **Admin Django:** http://127.0.0.1:8000/admin/

## 🛠️ Comandos Útiles

### Detener servidores:
```bash
# Detener todos los procesos relacionados
pkill -f "python manage.py runserver"
pkill -f "react-scripts start"

# O simplemente Ctrl+C en cada terminal
```

### Ver logs (cuando usas run-all.sh):
```bash
# Ver logs de Django
tail -f django.log

# Ver logs de React  
tail -f react.log
```

### Reinstalar dependencias:
```bash
# Python
pip install -r ../requirements.txt --force-reinstall

# Node.js
cd gestion_alumnos_frontend
rm -rf node_modules package-lock.json
npm install
```

## 🔧 Solución de Problemas

### Error de permisos en scripts:
```bash
chmod +x *.sh
chmod +x gestion_alumnos_frontend/*.sh
```

### Error de MySQL:
```bash
# Verificar que MySQL esté corriendo
sudo systemctl status mysql

# Iniciar si no está corriendo
sudo systemctl start mysql
```

### Error de puerto ocupado:
```bash
# Ver qué proceso usa el puerto 8000
sudo netstat -tulpn | grep :8000

# Ver qué proceso usa el puerto 3000  
sudo netstat -tulpn | grep :3000

# Matar proceso específico
kill -9 <PID>
```

### Error de dependencias Python:
```bash
# Actualizar pip
pip install --upgrade pip

# Reinstalar dependencias
pip install -r ../requirements.txt --force-reinstall
```

## 📝 Notas Adicionales

- Los scripts `.sh` son equivalentes a los `.ps1` de Windows
- Asegúrate de tener MySQL corriendo antes de iniciar el backend
- El script `run-all.sh` maneja automáticamente la limpieza de procesos
- Los logs se guardan en `django.log` y `react.log` cuando usas `run-all.sh`
- Usa Ctrl+C para detener los servidores de forma segura