#!/bin/bash

if [ -e ".env" ]; then
    source .env
fi;

if [ -e "./.env" ]; then
    source ./.env
fi;

DOCKER_IMAGE=trypton/lamp

case "$1" in
    'build')
        if [ "$(docker ps | grep $DOCKER_NAME)" ]; then
            docker stop $DOCKER_NAME
        fi;
        if [ "$(docker ps -a | grep $DOCKER_NAME)" ]; then
            docker rm $DOCKER_NAME
        fi;
        docker build -t $DOCKER_IMAGE ./docker/
        exit $? ;;
    'start')
        if [ ! "$(docker ps -a | grep $DOCKER_NAME)" ]; then
            docker run -d -p 8080:80 \
                --name $DOCKER_NAME \
                -v ${PWD}${WEB_FOLDER}:/var/www \
                -v ${PWD}/data/mysql:/var/lib/mysql \
                $DOCKER_IMAGE
        else
            docker start $DOCKER_NAME
        fi;
        exit $? ;;
    'stop')
        docker stop $DOCKER_NAME
        exit $? ;;
    'login')
        docker exec -it $DOCKER_NAME bash
        exit $? ;;
esac
