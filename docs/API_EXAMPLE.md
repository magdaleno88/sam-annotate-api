# SAM Annotate API example

These sample IDs and patient codes are fictional. The responses illustrate the current controller behavior; they are not output from a running production service.

Start a local development server after preparing PostgreSQL:

```bash
bin/rails db:prepare
bin/rails server
```

List tasks:

```http
GET /api/tasks

HTTP/1.1 200 OK
Content-Type: application/json

[{"id":1,"name":"Fictional review batch","description":"Demo task","status":"open"}]
```

Fetch the first image whose status is `pending` in task `1`:

```http
GET /api/tasks/1/next_image

HTTP/1.1 200 OK
Content-Type: application/json

{"id":7,"patient_code":"DEMO-001","status":"pending"}
```

When no pending image exists, the controller returns `{"message":"No hay imágenes pendientes"}`. This endpoint currently does not claim or lock an image, so simultaneous annotators could receive the same result. The example intentionally does not include an annotation write while the controller uses a fixed user ID.
