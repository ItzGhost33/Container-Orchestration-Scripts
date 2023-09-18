#!/bin/bash

# Define variables
APP_NAME="my-web-app"
IMAGE_NAME="my-web-app-image"
PORT=8080
NETWORK_NAME="my-web-app-network"
CONTAINER_COUNT=3

# Create a Docker network for the containers
docker network create $NETWORK_NAME

# Build the Docker image for the web application
docker build -t $IMAGE_NAME .

# Start multiple containers with the web application
for ((i=1; i<=$CONTAINER_COUNT; i++))
do
  CONTAINER_NAME="${APP_NAME}-container-$i"
  docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME -p $PORT:$PORT $IMAGE_NAME
  echo "Container $CONTAINER_NAME started."
done

echo "Container orchestration completed!"
