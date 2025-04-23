# Laravel + Docker + SQLite

Este proyecto es una configuración básica de Laravel usando Docker y SQLite como base de datos. Ideal para desarrollo local, liviano y rápido de levantar.

---

## 🚀 Pasos para levantar el entorno

### 📦 Requisitos

- Docker y Docker Compose instalados
- Laravel ya instalado en el proyecto
- Carpeta `docker/` con configuración de Nginx y PHP

---

### ⚙️ 1. Crear base de datos SQLite

```bash
mkdir -p database
touch database/database.sqlite
chmod -R 777 database


```.env
DB_CONNECTION=sqlite
DB_DATABASE=/var/www/database/database.sqlite

```Dar permisos
chmod -R 777 storage bootstrap/cache


```Levantar el entorno
docker-compose up -d --build


```Instalar dependencias y migrar base
docker-compose exec app composer install
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan migrate


