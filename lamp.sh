#!/bin/bash

if [ -e ".env" ]; then
    source .env
fi;

IMAGE_NAME=trypton/lamp
CONTAINER_RE="\s${CONTAINER_NAME}\b"

case "$1" in
    'build')
        if [ "$(docker ps | grep $CONTAINER_RE)" ]; then
            docker stop $CONTAINER_NAME
        fi;
        if [ "$(docker ps -a | grep $CONTAINER_RE)" ]; then
            docker rm $CONTAINER_NAME
        fi;
        docker build -t $IMAGE_NAME ./docker/
        exit $? ;;
    'start')
        if [ ! "$(docker ps -a | grep $CONTAINER_RE)" ]; then
            docker run -d -p 8080:80 \
                --name $CONTAINER_NAME \
                -v ${PWD}/${WEB_FOLDER}:/var/www \
                $IMAGE_NAME
        else
            docker start $CONTAINER_NAME
        fi;
        exit $? ;;
    'stop')
        docker stop $CONTAINER_NAME
        exit $? ;;
    'login')
        docker exec -it $CONTAINER_NAME bash
        exit $? ;;
esac
