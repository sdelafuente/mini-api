## Pasos para levantar el entorno

### PHP artisan (localhost:8000)
```bash
$ php artisan serve
```

### Docker (localhost:8000)
```bash
$ dock build -t api-name:tag .
$ docker run -p 8000:80 -d api-name:tag
```

### Terraform with Render + Docker image
 - Have an account in render.com (no free-tier)
 - Check the file main.tf to see the access
 - then execute:
```bash
$ terraform plan
$ terraform apply
```



