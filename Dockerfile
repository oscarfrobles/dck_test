FROM php:8.2-fpm

RUN apt-get update && apt-get install -y git curl vim autoconf build-essential libzip-dev unzip

#RUN curl -sSLf \
#            -o /usr/local/bin/install-php-extensions \
#            https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions

#RUN chmod +x /usr/local/bin/install-php-extensions

#RUN install-php-extensions xdebug

#RUN docker-php-ext-configure intl
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer



RUN pecl install xdebug zip \
    && docker-php-ext-enable xdebug zip


COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY ./xdebug.ini "${PHP_INI_DIR}/conf.d"



WORKDIR /app

