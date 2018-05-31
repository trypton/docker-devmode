FROM php:7.2-apache

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
    pecl install memcached-3.0.4 xdebug-2.6.0; \
    docker-php-ext-enable memcached xdebug; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr; \
    docker-php-ext-install pdo pdo_mysql mysqli gd intl soap; \
    \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

RUN echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_autostart = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_host = \${XDEBUG_REMOTE_HOST}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ADD apache/default.conf /etc/apache2/sites-enabled/000-default.conf
ADD php/custom.ini /usr/local/etc/php/conf.d/custom.ini

VOLUME /var/www
