#!/bin/bash

CONTAINER_NAME=testing
IMAGE=walmarmi/jaca-ceg3120:latest

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker pull $IMAGE
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE
