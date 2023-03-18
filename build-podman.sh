#!/bin/bash
APP_NAME="sanoid"
IMAGE_TAG="$APP_NAME-build"

podman build -t $IMAGE_TAG .
ID=$(podman create $IMAGE_TAG)
podman cp $ID:/build .
podman rm -v $ID
podman rmi $IMAGE_TAG
cp build/*.deb .
rm -rf build/
