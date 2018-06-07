#!/bin/bash

if [ -e ".env" ]; then
    source .env
fi;

case "$@" in
    'build')
        docker-compose build
        exit $? ;;
    'up')
        docker-compose up -d
        exit $? ;;
    'down')
        docker-compose down
        exit $? ;;
    'login')
        docker exec -it $CONTAINER_NAME-apache bash
        exit $? ;;
    'login node')
        docker exec -it $CONTAINER_NAME-nodejs bash
        exit $? ;;
    'alias')
        sudo ifconfig lo0 alias 10.254.254.254
        exit $? ;;
esac
