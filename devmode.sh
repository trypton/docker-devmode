#!/bin/bash

if [ -e ".env" ]; then
    source .env
fi;

case "$@" in
    'build')
        docker-compose build
        exit $? ;;
    'start')
        docker-compose up -d
        exit $? ;;
    'stop')
        docker-compose down
        exit $? ;;
    'login')
        docker exec -it $CONTAINER_NAME-apache bash
        exit $? ;;
    'login node')
        docker exec -it $CONTAINER_NAME-node bash
        exit $? ;;
esac
