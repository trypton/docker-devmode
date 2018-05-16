FROM php:5.6-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libmemcached-dev zlib1g-dev \
        libicu-dev \
        libxml2-dev \
    ; \
    \
    pecl install memcached-2.2.0 xdebug-2.5.5; \
    docker-php-ext-enable memcached xdebug; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr; \
    docker-php-ext-install pdo pdo_mysql mysqli gd intl soap; \
    \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

ADD apache/default.conf /etc/apache2/sites-enabled/000-default.conf
ADD php/php.ini /usr/local/etc/php/php.ini

VOLUME /var/www

EXPOSE 80
CMD ["apache2-foreground"]
