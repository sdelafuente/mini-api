FROM php:8.2-fpm-alpine AS backend

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

# Instalar nginx, PHP y extensiones necesarias
RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl \
    libxml2-dev libzip-dev zip unzip curl git sqlite-libs\
    php82-pdo_sqlite php82-session php82-mbstring php82-xml php82-zip php82-curl php82-fileinfo sqlite-dev

# Instalar PHP extensiones
RUN docker-php-ext-install pdo pdo_sqlite zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Crear carpetas necesarias
RUN mkdir -p /run/nginx /var/www /var/log/nginx

# Copiar la aplicación
COPY . /var/www
WORKDIR /var/www

# Copiar la config de Nginx
COPY docker/nginx/default.conf /etc/nginx/nginx.conf

# Copiar certificados SSL
COPY docker/ssl/server.crt /etc/ssl/certs/server.crt
COPY docker/ssl/server.key /etc/ssl/private/server.key

# Permisos para Laravel
RUN chmod -R 777 storage bootstrap/cache database

RUN composer update

# Exponer puertos
EXPOSE 80 443

# Comando para iniciar PHP-FPM y Nginx
CMD php-fpm -D && nginx -g "daemon off;"
