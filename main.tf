terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.6.0"
    }
  }
}

# provider "render" {
#  # Replace with your actual API key
#   #mail = "santiago.daniel.delafuente@hotmail.com"
#     owner_id = "usr-d03v9ridbo4c73c8cgb0"
#     api_key = "rnd_owJBFoSlb0u3r2XbevHm06pMzGhI"
# }

variable "render_api_key" {
  type        = string
  description = "rnd_owJBFoSlb0u3r2XbevHm06pMzGhI"
}

# ID del Web Service existente en Render (ej. srv-xxxxx)
variable "render_service_id" {
  type        = string
  description = "srv-d0460oc9c44c739ae660"
}

# Importa el servicio existente en tu estado de Terraform
import {
  to = render_web_service.mini_api
  id = var.render_service_id
}

resource "render_web_service" "mini_api" {
  name    = "mini-api"
  plan    = "starter"
  region  = "oregon"
    environment_id = "evm-d044lv49c44c7399be80"
  # Desplegar usando tu Dockerfile en el repositorio
#   docker {
#     dockerfile_path = "Dockerfile"
#     context_path    = "./"
#     auto_deploy     = true
#   }
  runtime_source = {
    docker = {
        auto_deploy = true
        registry   = "docker.io"
        branch = "master"
        repo_url = "30281856/mini-api"
        image_url = "30281856/mini-api"
         tag = "latest"
    }
  }
    #   Alternativamente, para una imagen ya construida en un registry


    env_vars = {
        "APP_NAME" = { value = "Laravel",  sync = true },
        APP_ENV = { value = "local", sync = true },
        APP_KEY = { value = "base64:i9tQesgXRp4qjsD4oRSGsOvWB8H+qqVGq3H12RxRoA4=", sync = true },
        APP_DEBUG = {value = "true",  sync = true },
        APP_URL = { value = "http://localhost", sync = true },
        APP_LOCALE = {    value = "en",    sync = true },
        APP_FALLBACK_LOCALE = {value = "en",    sync = true },
        APP_FAKER_LOCALE = {   value = "en_US", sync = true },
        APP_MAINTENANCE_DRIVER = {  value = "file",  sync = true },
        PHP_CLI_SERVER_WORKERS = {  value = "4",     sync = true },
        BCRYPT_ROUNDS = { value = "12",    sync = true },
    LOG_CHANNEL = {    value = "stack", sync = true },
    LOG_STACK = { value = "single",     sync = true },
    LOG_DEPRECATIONS_CHANNEL = { value = "null",  sync = true },
    LOG_LEVEL = { value = "debug", sync = true },
    DB_CONNECTION = {  value = "sqlite",     sync = true },
    SESSION_DRIVER = { value = "database",   sync = true },
    SESSION_LIFETIME = {    value = "120",   sync = true },
    SESSION_ENCRYPT = {     value = "false", sync = true },
    SESSION_PATH = {   value = "/",     sync = true },
    SESSION_DOMAIN = { value = "null",  sync = true },
    BROADCAST_CONNECTION = {     value = "log",   sync = true },
    FILESYSTEM_DISK = {     value = "local", sync = true },
    QUEUE_CONNECTION = {    value = "database",   sync = true },
    CACHE_STORE = {    value = "database",   sync = true },
    MEMCACHED_HOST = { value = "127.0.0.1",  sync = true },
    REDIS_CLIENT = {   value = "phpredis",   sync = true },
    REDIS_HOST = {     value = "127.0.0.1",  sync = true },
    REDIS_PASSWORD = { value = "null",  sync = true },
    REDIS_PORT = {     value = "6379",  sync = true },
    MAIL_MAILER = {    value = "log",   sync = true },
    MAIL_SCHEME = {    value = "null",  sync = true },
    MAIL_HOST = { value = "127.0.0.1",  sync = true },
    MAIL_PORT = { value = "2525",  sync = true },
    MAIL_USERNAME = {  value = "null",  sync = true },
    MAIL_PASSWORD = {  value = "null",  sync = true },
    MAIL_FROM_ADDRESS = {   value = "hello@example.com",     sync = true },
    MAIL_FROM_NAME = { value = "Laravel",     sync = true },
    AWS_ACCESS_KEY_ID = {   value = "", sync = true },
    AWS_SECRET_ACCESS_KEY = {    value = "", sync = true },
    AWS_DEFAULT_REGION = {  value = "us-east-1",  sync = true },
    AWS_BUCKET = {     value = "", sync = true },
    AWS_USE_PATH_STYLE_ENDPOINT = {   value = "false", sync = true },
    VITE_APP_NAME = {       value = "Laravel",     sync = true },
    }
    # ESTA MAL EL ORDEN, TENES QUE PASAR TODO TAL COMO EL NOMBRE
    # ]

}
