#!/bin/bash

if [ -e ".env" ]; then
    source .env
fi;

case "$1" in
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
        docker exec -it $CONTAINER_NAME bash
        exit $? ;;
esac
