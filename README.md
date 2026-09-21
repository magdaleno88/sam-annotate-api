# SAM Annotate API

API REST experimental para organizar imágenes, tareas de clasificación y anotaciones. El proyecto modela la relación entre imágenes, clases, tareas y usuarios, con una base PostgreSQL y almacenamiento de archivos mediante Active Storage.

## Qué implementa actualmente

- Registro y consulta de imágenes con un archivo adjunto y un código de paciente.
- Consulta de tareas y recuperación de la siguiente imagen pendiente de una tarea.
- Creación de anotaciones que relacionan una imagen, una clase y un usuario.
- Modelo de datos para asignar imágenes a tareas y conservar sus anotaciones.
- Flujo de CI con análisis de seguridad, estilo y ejecución de pruebas.

## Tecnologías

Ruby 3.4.4 · Rails 8.1 · PostgreSQL · Active Storage · Devise

## Endpoints implementados

| Método | Ruta | Función |
| --- | --- | --- |
| `GET` | `/api/images` | Lista las imágenes |
| `POST` | `/api/images` | Crea una imagen con `patient_code` y `file` |
| `GET` | `/api/tasks` | Lista las tareas |
| `GET` | `/api/tasks/:id` | Muestra una tarea |
| `GET` | `/api/tasks/:id/next_image` | Devuelve la primera imagen pendiente de la tarea |
| `POST` | `/api/annotations` | Crea una anotación con `image_id`, `classification_class_id` y `notes` |

Las rutas de Rails incluyen recursos adicionales, pero la tabla describe únicamente las acciones que aparecen implementadas en los controladores.

## Ejecutar en desarrollo

Requiere Ruby 3.4.4, Bundler y PostgreSQL. Define `SAM_ANNOTATE_DATABASE_PASSWORD` en tu entorno local con la contraseña de PostgreSQL antes de preparar la base de datos. No la agregues al repositorio.

```bash
bundle install
bin/rails db:prepare
bin/rails server
```

Con el servidor iniciado, la API estará disponible en `http://localhost:3000`. Para ejecutar la suite incluida:

```bash
bin/rails test
```

## Modelo de datos

```text
User ──< Annotation >── Image ──< TaskImage >── Task
                  │
                  └── ClassificationClass
```

Los archivos de imagen se almacenan mediante Active Storage. `TaskImage` permite asociar una imagen a una o varias tareas.

## Estado y límites

Este repositorio es un **prototipo en desarrollo**. Los archivos de prueba revisados contienen marcadores de posición y todavía necesitan casos que comprueben la API. La creación de anotaciones asigna actualmente un usuario fijo, por lo que debe vincularse al usuario autenticado antes de exponer el servicio. La contraseña que estuvo publicada en versiones anteriores debe cambiarse; retirarla de la versión actual no la borra del historial de Git.

No cargues imágenes clínicas reales ni datos personales en una instalación pública sin completar antes autenticación, autorización y controles de privacidad.
