# THREADS-IS
Repositorio para el equipo 2 THREADS

# Ciencias_Top

## Descripción

Ciencias_Top es  un prototipo de plataforma diseñada para la gestión y administración de rentas de productos que ofrece la facultad de ciencias. Este proyecto permite a los administradores y usuarios gestionar de manera eficiente el alquiler de equipos y materiales, proporcionando una interfaz intuitiva y funcionalidades avanzadas para el seguimiento y control de las rentas.

## Características

Gestión de Usuarios: Permite la creación, edición y eliminación de usuarios con diferentes roles (administradores y usuarios regulares).
Historial de Rentas: Los administradores pueden ver el historial de rentas de cualquier usuario, ordenado por fecha.
Autenticación y Autorización: Implementa un sistema de autenticación para asegurar que solo los usuarios autorizados puedan acceder a ciertas funcionalidades.
Interfaz Intuitiva: Una interfaz de usuario amigable que facilita la navegación y el uso de la plataforma.

## Tecnologías Utilizadas

Django: Framework web utilizado para el desarrollo del backend.
HTML/CSS: Para la creación de la interfaz de usuario.
JavaScript: Para mejorar la interactividad de la interfaz.
PostgreSQL: Base de datos utilizada para almacenar la información de las rentas y usuarios.
Docker: Para la contenedorización de la aplicación y la base de datos.

## Instrucciones para levantar el proyecto

### Prerrequisitos

Tener Docker y Docker Compose instalados.

### Paso 1: Clonar el repositorio

Clona el repositorio desde GitHub y navega al directorio del proyecto:


### Paso 2: Construir y ejecutar los contenedores Docker

Construye y ejecuta los contenedores Docker:

docker-compose up --build


### Paso 3: Migrar la base de datos
En otra terminal, migra la base de datos:

docker-compose exec web python manage.py migrate

### Paso 4: Crear un superusuario (opcional)
Si  se desea crear un superusuario para acceder al panel de administración de Django, ejecuta:


docker-compose exec web python manage.py createsuperuser



### Paso 5: Acceder a la aplicación
Abrir el navegador web y acceder  a la aplicación en
http://localhost:8000 


### Ejecutar Comandos de Django
Para trabajar se necesitan 2 consolas: en una estará corriendo Docker y en la otra se ejecutarán los comandos de Django utilizando docker-compose exec.

- docker-compose exec web python manage.py makemigrations
- docker-compose exec web python manage.py migrate
- docker-compose exec web python manage.py shell
- docker-compose exec web python manage.py loaddata data.json
- docker-compose exec web python manage.py tu_comando_personalizado
- docker-compose exec web python manage.py runserver 0.0.0.0:8000
- si no jala el de arriba usar un puerto diferente  docker-compose exec web python manage.py runserver 0.0.0.0:8001

**Detener y eliminar los contenedores actuales:**

   
   docker-compose down
