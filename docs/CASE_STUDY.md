# SAM Annotate API | Case study

[Español](#español) · [English](#english)

## Español

### El problema

Un flujo de clasificación de imágenes necesita conservar qué imágenes pertenecen a una tarea y qué anotación se registró para cada una. Separar esas entidades permite consultar el trabajo pendiente y mantener las anotaciones vinculadas a una clase.

### Lo que construí

Este prototipo Rails modela imágenes, tareas, clases, usuarios y anotaciones con PostgreSQL. Active Storage recibe archivos. Los controladores implementan la consulta de tareas, la primera imagen pendiente y la creación de anotaciones. La [referencia de API](API_EXAMPLE.md) usa identificadores ficticios para mostrar el contrato visible en el código.

### Estado y siguientes pasos

El flujo sigue siendo experimental. La selección de imagen pendiente consulta el estado de la imagen y devuelve la primera coincidencia; no reserva el trabajo para un anotador. La creación de anotaciones usa un usuario fijo. Antes de ofrecerlo a varios usuarios deben añadirse autenticación y autorización efectivas, validaciones, respuestas de error explícitas y una asignación atómica de tareas. Los datos clínicos reales requieren controles de privacidad adicionales.

El repositorio incluye CI y nuevas pruebas de consulta de tareas. No hay mediciones de carga, pruebas de usuarios ni despliegue público.

## English

### The problem

An image classification workflow needs to track which images belong to a task and which annotation was recorded for each image. Separate entities make it possible to inspect pending work and keep annotations associated with a class.

### What I built

This Rails prototype models images, tasks, classes, users and annotations in PostgreSQL. Active Storage receives files. Controllers implement task listing, retrieval of the first pending image and annotation creation. The [API example](API_EXAMPLE.md) uses fictional IDs to illustrate the contract present in the code.

### Status and next steps

The workflow is experimental. Pending-image selection reads image status and returns the first match; it does not reserve work for an annotator. Annotation creation uses a fixed user. Before multi-user use, it needs effective authentication and authorization, validations, explicit error responses and atomic task assignment. Real clinical data require additional privacy controls.

The repository includes CI and tests for task retrieval. There are no load measurements, user studies or public deployment.
