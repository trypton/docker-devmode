FROM node:carbon

EXPOSE 8080
EXPOSE 443

VOLUME /usr/src/app

ADD ssl/localhost.crt /etc/ssl/certs/localhost.crt
ADD ssl/localhost.key /etc/ssl/private/localhost.key

ADD entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod u+x /usr/local/bin/docker-entrypoint
WORKDIR /usr/src/app

ENTRYPOINT ["docker-entrypoint"]
