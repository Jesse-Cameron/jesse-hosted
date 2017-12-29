#! /bin/bash

echo "pushing container"

#Check amount of arguments is correct
if [ "$#" -ne 6 ]; then
  usage
  exit 1
fi

DOCKER_USER=${1}
DOCKER_PASSWORD=${2}
SOURCE_CONTAINER=${3}
DOCKER_REPO=${4}
BRANCH=${5}
VERSION=${6}


TAG=$(echo "${BRANCH//'/'/-}-${VERSION}")
TAG_LATEST=$(echo "${BRANCH//'/'/-}-latest")

docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"

docker tag "$SOURCE_CONTAINER" "$DOCKER_REPO:$TAG"
docker push "$DOCKER_REPO:$TAG"

docker tag "$SOURCE_CONTAINER" "$DOCKER_REPO:$TAG_LATEST"
docker push "$DOCKER_REPO:$TAG_LATEST"