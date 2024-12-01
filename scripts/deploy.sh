#!/bin/bash

# Variables
CONTAINER_NAME="my-python-app"
IMAGE_NAME="your-docker-hub-username/my-python-app:latest"

echo "Deploying application using Docker..."

# Stop and remove any existing container with the same name
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Pull the latest image from Docker Hub
docker pull $IMAGE_NAME

# Run the container
docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME

echo "Deployment successful. Application is running on port 5000."
