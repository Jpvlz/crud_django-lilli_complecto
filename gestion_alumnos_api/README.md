# Proyecto API REST Django con React.js - Gestión de Alumnos

Este proyecto implementa un sistema CRUD completo para la gestión de alumnos, siguiendo exactamente el tutorial especificado. Incluye un backend API REST desarrollado con Django y Django REST Framework, y un frontend desarrollado con React.js.

## 🏗️ Estructura del Proyecto

```
gestion_alumnos_api/                    (Carpeta raíz del proyecto Django)
├── gestion_alumnos_api/               (Carpeta del proyecto Django - contiene archivos de configuración)
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py                    (Configuración de Django, incluyendo la base de datos)
│   ├── urls.py                        (Configuración de las URLs del proyecto)
│   ├── wsgi.py
│   └── __pycache__/
├── alumnos/                           (Aplicación Django para la gestión de alumnos)
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations/                    (Contiene los archivos de migración de la base de datos)
│   │   └── __init__.py
│   ├── models.py                      (Definición del modelo de datos Alumno)
│   ├── serializers.py                (Definición de los serializadores para los modelos)
│   ├── tests.py
│   ├── views.py                       (Definición de las vistas de la API - ViewSets)
│   └── __pycache__/
├── venv/                              (Entorno virtual de Python - contiene las dependencias)
├── manage.py                          (Script para ejecutar comandos de Django)
├── crear_datos_prueba.py              (Script para crear datos de prueba)
├── db.sqlite3                         (Base de datos SQLite)
└── gestion_alumnos_frontend/          (Carpeta raíz del proyecto React)
    ├── node_modules/                  (Contiene las dependencias de Node.js)
    ├── public/                        (Archivos estáticos como index.html)
    │   ├── index.html
    │   └── ...
    ├── src/                           (Código fuente de la aplicación React)
    │   ├── App.js                     (Componente principal de la aplicación)
    │   ├── index.js                   (Punto de entrada de la aplicación)
    │   ├── components/                (Carpeta para los componentes React)
    │   │   ├── ListaAlumnos.js
    │   │   ├── CrearAlumno.js
    │   │   ├── EditarAlumno.js
    │   │   └── ...
    │   ├── App.css                    (Estilos para el componente App)
    │   ├── index.css                  (Estilos globales)
    │   └── ...
    ├── .gitignore
    ├── package.json                   (Información del proyecto y dependencias de npm)
    ├── package-lock.json              (Información detallada de las dependencias de npm)
    └── README.md
```

## 📋 Requisitos Previos

- **Python 3.8+**
- **Node.js 14+** y **npm**
- **MySQL** (opcional, el proyecto usa SQLite por defecto para desarrollo)

## 🚀 Instalación y Configuración

### Backend (Django REST Framework)

#### Paso 1: Configuración del Entorno Django

1. **Crear un entorno virtual:**
   ```powershell
   python -m venv venv
   ```

2. **Activar el entorno virtual:**
   ```powershell
   venv\Scripts\activate  # En Windows
   ```

3. **Instalar dependencias:**
   ```powershell
   pip install django djangorestframework mysqlclient django-cors-headers
   ```

4. **El proyecto Django ya está creado** en `gestion_alumnos_api/`

#### Paso 2: Configuración de la Base de Datos

El proyecto está configurado para usar **SQLite** por defecto para facilitar el desarrollo. Si deseas usar **MySQL**, descomenta la configuración en `gestion_alumnos_api/settings.py`:

```python
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'gestion_alumnos',
#         'USER': 'root',
#         'PASSWORD': '',
#         'HOST': 'localhost',
#         'PORT': '3306',
#     }
# }
```

**Para usar MySQL, primero crea la base de datos:**
```sql
CREATE DATABASE IF NOT EXISTS gestion_alumnos;
USE gestion_alumnos;

CREATE TABLE IF NOT EXISTS alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    numero_documento VARCHAR(20) UNIQUE NOT NULL,
    nota1 DECIMAL(5, 2) NOT NULL,
    nota2 DECIMAL(5, 2) NOT NULL,
    nota3 DECIMAL(5, 2) NOT NULL
);
```

#### Paso 3: Aplicar Migraciones

```powershell
cd gestion_alumnos_api
python manage.py makemigrations alumnos
python manage.py migrate
```

#### Paso 4: Crear Datos de Prueba

```powershell
python crear_datos_prueba.py
```

#### Paso 5: Ejecutar el Servidor Django

```powershell
python manage.py runserver
```

La API estará disponible en: **http://127.0.0.1:8000/api/alumnos/**

### Frontend (React.js)

#### Paso 1: El proyecto React ya está creado en `gestion_alumnos_frontend/`

#### Paso 2: Instalar Dependencias

```powershell
cd gestion_alumnos_frontend
npm install
```

Las dependencias ya incluyen:
- `axios` - Para peticiones HTTP
- `react-router-dom` - Para navegación
- `bootstrap` y `react-bootstrap` - Para estilos
- `react-icons` - Para iconos

#### Paso 3: Ejecutar el Frontend React

```powershell
npm start
```

La aplicación estará disponible en: **http://localhost:3000**

## 🔧 Configuración Técnica

### Backend - Configuraciones Clave

#### En `gestion_alumnos_api/settings.py`:

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'corsheaders',   
    'rest_framework',
    'alumnos',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
]

REST_FRAMEWORK = {
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
    ],
    'DEFAULT_PARSER_CLASSES': [
        'rest_framework.parsers.JSONParser',
    ],
}
```

### Modelo de Datos

El modelo `Alumno` en `alumnos/models.py`:

```python
class Alumno(models.Model):
    nombre = models.CharField(max_length=100)
    numero_documento = models.CharField(max_length=20, unique=True)
    nota1 = models.DecimalField(max_digits=5, decimal_places=2)
    nota2 = models.DecimalField(max_digits=5, decimal_places=2)
    nota3 = models.DecimalField(max_digits=5, decimal_places=2)

    def promedio(self):
        return (self.nota1 + self.nota2 + self.nota3) / 3

    def __str__(self):
        return self.nombre
```

## API Endpoints

| Método | URL | Descripción |
|--------|-----|-------------|
| GET | `/api/alumnos/` | Listar todos los alumnos |
| POST | `/api/alumnos/` | Crear nuevo alumno |
| GET | `/api/alumnos/{id}/` | Obtener alumno específico |
| PUT | `/api/alumnos/{id}/` | Actualizar alumno completo |
| PATCH | `/api/alumnos/{id}/` | Actualizar alumno parcial |
| DELETE | `/api/alumnos/{id}/` | Eliminar alumno |

### Ejemplo de datos JSON:

**Crear alumno:**
```json
{
    "nombre": "Juan Pérez",
    "numero_documento": "123456789",
    "nota1": 4.5,
    "nota2": 3.8,
    "nota3": 4.2
}
```

**Respuesta:**
```json
{
    "id": 1,
    "nombre": "Juan Pérez",
    "numero_documento": "123456789",
    "nota1": "4.50",
    "nota2": "3.80",
    "nota3": "4.20",
    "promedio": 4.166666666666667
}
```

## 🎨 Componentes Frontend

### 1. ListaAlumnos.js
- Muestra tabla con todos los alumnos
- Incluye columnas: ID, Nombre, Documento, Nota1, Nota2, Nota3, Promedio, Acciones
- Botones para editar y eliminar con iconos
- Confirmación antes de eliminar

### 2. CrearAlumno.js
- Formulario para crear nuevos alumnos
- Validación de campos requeridos
- Redirección automática después de crear

### 3. EditarAlumno.js
- Formulario pre-cargado con datos del alumno
- Actualización via API PUT
- Manejo de estados de carga y errores

## 🧪 Pruebas con Postman

### Obtener todos los alumnos:
- **Método:** GET
- **URL:** `http://127.0.0.1:8000/api/alumnos/`

### Crear alumno:
- **Método:** POST
- **URL:** `http://127.0.0.1:8000/api/alumnos/`
- **Headers:** `Content-Type: application/json`
- **Body:**
```json
{
    "nombre": "Margarita Escobar",
    "numero_documento": "446447",
    "nota1": 5.00,
    "nota2": 4.60,
    "nota3": 3.00
}
```

### Actualizar alumno:
- **Método:** PUT
- **URL:** `http://127.0.0.1:8000/api/alumnos/{id}/`

### Eliminar alumno:
- **Método:** DELETE
- **URL:** `http://127.0.0.1:8000/api/alumnos/{id}/`

## 🔄 Scripts de Ejecución Rápida

### Backend:
```powershell
cd gestion_alumnos_api
venv\Scripts\activate
python manage.py runserver
```

### Frontend:
```powershell
cd gestion_alumnos_frontend
npm start
```

## 🎯 Funcionalidades Implementadas

✅ **Modelo Alumno** con campos: nombre, numero_documento, nota1, nota2, nota3  
✅ **Cálculo automático de promedio**  
✅ **API REST completa** (GET, POST, PUT, DELETE)  
✅ **Frontend React** con navegación y componentes  
✅ **CRUD completo** desde la interfaz web  
✅ **Validaciones** y manejo de errores  
✅ **Confirmaciones** antes de eliminar  
✅ **Bootstrap** para estilos responsivos  
✅ **Iconos** para mejorar UX  
✅ **CORS configurado** para desarrollo  
✅ **Datos de prueba** incluidos  

## 🚀 Acceso a la Aplicación

- **Frontend (interfaz web)**: http://localhost:3000
- **API REST**: http://127.0.0.1:8000/api/alumnos/
- **Admin Django**: http://127.0.0.1:8000/admin/

## ⚠️ Solución de Problemas

### Error de CORS
Si el frontend no puede conectar con la API, verifica que:
- El servidor Django esté corriendo en el puerto 8000
- CORS_ALLOWED_ORIGINS incluya "http://localhost:3000"

### Error de dependencias Node.js
```powershell
npm audit fix
```

### Error de migraciones Django
```powershell
python manage.py makemigrations
python manage.py migrate
```

## 📝 Notas Importantes

- El proyecto usa **SQLite** por defecto para facilitar el desarrollo
- Para producción, cambiar a **MySQL** o **PostgreSQL**
- Los datos de prueba se crean automáticamente con el script
- El cálculo del promedio se hace automáticamente en el serializador
- Bootstrap proporciona estilos responsivos automáticos

Este proyecto implementa exactamente el tutorial especificado y está listo para usar en desarrollo.

## 👨‍💻 Desarrollo

Para continuar el desarrollo:
1. Ambos servidores deben estar corriendo simultáneamente
2. Los cambios en React se reflejan automáticamente (hot reload)
3. Los cambios en Django requieren reiniciar el servidor manualmente

¡El proyecto está completo y funcional según las especificaciones del tutorial!


##  OPTIMIZACIONES APLICADAS (Nueva Versi�n)

###  Frontend React Optimizado
- **CSS Modular**: Separados los estilos en archivos CSS individuales por componente
- **Eliminaci�n de CSS embebido**: Removido todo el CSS inline y estilos embebidos
- **Estructura limpia**: 
  - `App.css` - Estilos de navegaci�n
  - `Dashboard.css` - Estilos del panel de estad�sticas  
  - `GestionAlumnos.css` - Estilos de gesti�n y tabla
  - `CrearAlumno.css` - Estilos formulario de creaci�n
  - `EditarAlumno.css` - Estilos formulario de edici�n
- **Performance**: Eliminadas animaciones innecesarias y efectos que no agregan valor
- **C�digo limpio**: Removidos archivos README redundantes y c�digo no utilizado

###  Backend Django Optimizado  
- **Admin mejorado**: Agregados filtros por promedio, ordenamiento y campo promedio visible
- **Eliminaci�n de archivos**: Removidos tests vac�os y archivos innecesarios
- **Estructura limpia**: Solo los archivos esenciales para el funcionamiento

###  Archivos Eliminados/Optimizados
-  `package-lock.json` duplicado en ra�z
-  `README.md` redundante del frontend React  
-  `tests.py` vac�o
-  CSS embebido en todos los componentes JS
-  Estilos no utilizados y reglas CSS vac�as
-  Archivos CSS externos organizados por componente

###  Resultado Final
- **Separaci�n de responsabilidades**: CSS y JS en archivos separados
- **Mantenibilidad**: F�cil localizaci�n y modificaci�n de estilos
- **Performance**: C�digo m�s liviano sin CSS redundante
- **Escalabilidad**: Estructura preparada para crecimiento del proyecto
- **Legibilidad**: C�digo m�s limpio y organizado

**Total de archivos optimizados**: 8 componentes + estructura general
