## Steps to deploy

### Explanation
This is a PHP aplication that acomplish de problem in README.md.
It uses a Laravel 12.x Framwork + SQlite database
Its dockerize and the production platform used was render.com

** Render has a use for Terraform but unfortunately is non-free-tier
** explicar que no esta testeado
**

### Prod
Github action:

### Local - PHP artisan (localhost:8000)
```bash
$ php artisan serve
```

### Local Docker (localhost:8000)
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



