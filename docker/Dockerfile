FROM ubuntu

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    apt-get install -y apache2 && \
    a2enmod rewrite && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php \
        libapache2-mod-php \
        php-cli \
        php-gd \
        php-mbstring \
        php-mysql \
        php-pdo \
        php-xml \
        php-xdebug && \
    mkdir -p /usr/local/etc/php && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PHPRC=/usr/local/etc/php/php.ini

ADD apache/default.conf /etc/apache2/sites-enabled/000-default.conf
ADD php/php.ini /usr/local/etc/php/php.ini

VOLUME "/var/www"

ADD entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod u+x /usr/local/bin/docker-entrypoint
EXPOSE 80
ENTRYPOINT ["docker-entrypoint"]
