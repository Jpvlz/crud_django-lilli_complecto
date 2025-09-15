# Sistema de Gestión de Alumnos - Django REST API + React

Proyecto completo CRUD para gestión de alumnos que incluye:

- **Backend**: Django + Django REST Framework con API REST para `Alumno`
- **Frontend**: React + Bootstrap + React Router para SPA completa
- **Base de datos**: MySQL (XAMPP)

## Características
- ✅ CRUD completo de alumnos (Crear, Leer, Actualizar, Eliminar)
- ✅ Cálculo automático de promedio de notas
- ✅ Interfaz moderna con Bootstrap
- ✅ API REST completamente funcional
- ✅ Base de datos MySQL con XAMPP

## Requisitos
- Python 3.8+
- Node.js 14+
- XAMPP (MySQL)

## Instalación y Ejecución

### Paso 1: Preparar XAMPP
1. Inicia XAMPP Control Panel
2. Inicia el servicio **MySQL**

### Paso 2: Backend Django
```powershell
cd C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api
.\run-backend.ps1
```

### Paso 3: Frontend React
Abre **otra terminal** y ejecuta:
```powershell
cd C:\Users\USUARIO\Desktop\Sena\Python\Crud_Django\gestion_alumnos_api\gestion_alumnos_frontend
.\run-frontend.ps1
```

## URLs del Proyecto
- **Frontend**: http://localhost:3000
- **API REST**: http://127.0.0.1:8000/api/alumnos/
- **Admin Django**: http://127.0.0.1:8000/admin/

## Estructura del Proyecto
```
gestion_alumnos_api/
├── alumnos/                    # App Django
│   ├── models.py              # Modelo Alumno
│   ├── serializers.py         # Serializers para API
│   ├── views.py               # ViewSet para CRUD
│   └── admin.py               # Admin interface
├── gestion_alumnos_api/       # Configuración Django
│   ├── settings.py            # Configuración (MySQL, CORS)
│   └── urls.py                # URLs principales
├── gestion_alumnos_frontend/  # App React
│   ├── src/
│   │   ├── App.js             # Componente principal
│   │   └── components/
│   │       ├── ListaAlumnos.js    # Lista de alumnos
│   │       ├── CrearAlumno.js     # Crear alumno
│   │       └── EditarAlumno.js    # Editar alumno
│   ├── package.json           # Dependencias React
│   └── run-frontend.ps1       # Script de ejecución
├── manage.py                  # Django management
├── crear_datos_prueba.py      # Script de datos de prueba
├── verificar_db.py            # Script de verificación
└── run-backend.ps1            # Script de ejecución
```

## Modelo de Datos

### Alumno
```python
class Alumno(models.Model):
    nombre = models.CharField(max_length=100)
    numero_documento = models.CharField(max_length=20, unique=True)
    nota1 = models.DecimalField(max_digits=5, decimal_places=2)
    nota2 = models.DecimalField(max_digits=5, decimal_places=2)
    nota3 = models.DecimalField(max_digits=5, decimal_places=2)
    
    def promedio(self):
        return (self.nota1 + self.nota2 + self.nota3) / 3
```

## API Endpoints

| Método | URL | Descripción |
|--------|-----|-------------|
| GET | `/api/alumnos/` | Listar todos los alumnos |
| POST | `/api/alumnos/` | Crear nuevo alumno |
| GET | `/api/alumnos/{id}/` | Obtener alumno específico |
| PUT | `/api/alumnos/{id}/` | Actualizar alumno |
| DELETE | `/api/alumnos/{id}/` | Eliminar alumno |

## Funcionalidades Frontend

### Lista de Alumnos
- Tabla con información completa de cada alumno
- Promedio calculado automáticamente
- Botones de editar y eliminar con iconos
- Navegación a formulario de creación

### Crear Alumno
- Formulario con validación
- Campos para nombre, documento y 3 notas
- Redirección automática tras crear
- Alertas de éxito/error

### Editar Alumno
- Formulario pre-poblado con datos actuales
- Actualización en tiempo real
- Validación de datos
- Navegación de regreso

## Dependencias

### Backend (Python)
```
Django>=3.2,<5
djangorestframework>=3.12
django-cors-headers>=3.13
mysqlclient>=2.0
```

### Frontend (Node.js)
```
react
react-dom
react-router-dom
axios
bootstrap
react-bootstrap
react-icons
```

## Base de Datos MySQL

### Configuración
- **Base de datos**: `gestion_alumnos_django`
- **Usuario**: `root`
- **Contraseña**: (vacía)
- **Host**: `localhost:3306`

### Datos de Prueba
El proyecto incluye 3 alumnos de ejemplo:
1. Juan Pérez (Doc: 123456789) - Promedio: 4.17
2. María Gómez (Doc: 987654321) - Promedio: 4.20
3. Carlos López (Doc: 112233445) - Promedio: 3.23

## Comandos Útiles

### Verificar Base de Datos
```powershell
cd gestion_alumnos_api
python verificar_db.py
```

### Crear Superusuario
```powershell
cd gestion_alumnos_api
python manage.py createsuperuser
```

### Resetear Datos
```powershell
cd gestion_alumnos_api
python crear_datos_prueba.py
```

## Desarrollo

Este proyecto fue desarrollado siguiendo el tutorial "Proyecto ApiREst django con react js" y utiliza las mejores prácticas para:
- Separación de responsabilidades (Backend/Frontend)
- API RESTful con Django REST Framework
- Interfaz moderna con React y Bootstrap
- Base de datos relacional con MySQL

## Autor
Desarrollado como proyecto educativo del SENA
