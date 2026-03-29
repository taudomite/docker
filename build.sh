#!/bin/sh
set -e
# build.sh - build the Docker image and run the container while passing
# the MB value into /app/start.sh via the LOOKBUSY_MB environment variable.
#
# Usage:
#   ./build.sh 4000MB         # pass MB as positional arg
#   LOOKBUSY_MB=3000MB ./build.sh
#   ./build.sh               # defaults to 4000MB

IMAGE_NAME="lookbusy-app"
MB="${1:-${LOOKBUSY_MB:-4000MB}}"

echo "Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "Running container (temporary) with LOOKBUSY_MB=$MB"
docker run --rm -e LOOKBUSY_MB="$MB" "$IMAGE_NAME"

echo "Container exited (or was removed)."
