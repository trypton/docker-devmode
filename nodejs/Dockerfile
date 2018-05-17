FROM node:carbon

EXPOSE 8080

VOLUME /usr/src/app

ADD entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod u+x /usr/local/bin/docker-entrypoint
WORKDIR /usr/src/app

ENTRYPOINT ["docker-entrypoint"]
