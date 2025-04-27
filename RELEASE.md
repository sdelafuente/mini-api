## Steps to deploy

### Explanation
This is a PHP aplication that meets the README.md.
It uses a Laravel 12.x Framwork + SQlite database + Docker
The platform chosen was render.com


### Production steps
 1 - Make a tag v.* on master branch
 2 - Wait and see the output of GHA. [See ref](.github/workflows/README.md)

Note: The GHA implementation needs GH secrets. The repository used for testing with a working GHA is: https://github.com/sdelafuente/mini-api

### Local Docker (localhost:8000)
```bash
$ docker build -t api-name:tag .
$ docker run -p 8000:80 -d api-name:tag
```

### Local steps - PHP artisan (localhost:8000)
Pre-requisites: This asumes that you have at least php8.2 and all the libraries + Composer installed locally
 - git clone
 - git checkout master
 - composer install
 - cp .env.example .env
 - php artisan key:generate
 - php artisan optimize
 - php artisan serve

```bash
$ php artisan serve
```

### Terraform with Render + Docker image
 - Have an account in render.com (no free-tier)
 - then execute:

```bash
$ terraform plan
$ terraform apply
```

Note: this implementation is not production tested because render needs an account that is not free-tier to use Terraform
