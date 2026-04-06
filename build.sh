#!/bin/sh
set -e
# build.sh - build the Docker image and run the container while passing
# the MB value into /app/start.sh via the LOOKBUS_MB environment variable.
#
# Usage:
#   ./build.sh 4000MB         # pass MB as positional arg
#   LOOKBUS_MB=3000MB ./build.sh
#   ./build.sh               # defaults to 4000MB

IMAGE_NAME="lookbus-app"
MB="${1:-${LOOKBUS_MB:-4000MB}}"

echo "Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "Stopping and removing existing container if any..."
docker ps -q -f name=lookbus-cont | xargs docker rm -f 2>/dev/null || true

echo "Running container (temporary) with LOOKBUS_MB=$MB"
docker run -d --rm --name lookbus-cont -e LOOKBUS_MB="$MB" "$IMAGE_NAME"

echo "Container is running in the background"
