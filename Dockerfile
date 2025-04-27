FROM php:8.2-fpm-alpine AS backend

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl \
    libxml2-dev libzip-dev zip unzip curl git sqlite-libs\
    php82-pdo_sqlite php82-session php82-mbstring php82-xml php82-zip php82-curl php82-fileinfo sqlite-dev

RUN docker-php-ext-install pdo pdo_sqlite zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p /run/nginx /var/www /var/log/nginx

COPY . /var/www
WORKDIR /var/www

COPY docker/nginx/default.conf /etc/nginx/nginx.conf

COPY docker/ssl/server.crt /etc/ssl/certs/server.crt
COPY docker/ssl/server.key /etc/ssl/private/server.key

RUN chmod -R 777 storage bootstrap/cache database

RUN composer update

RUN cp .env.example .env && \
    php artisan key:generate && \
    php artisan optimize


EXPOSE 80 443

CMD php-fpm -D && nginx -g "daemon off;"