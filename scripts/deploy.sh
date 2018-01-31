#!/bin/bash

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

docker-compose -f docker-compose.yml build

TAG=$(echo "${BRANCH//'/'/-}-${VERSION}")
TAG_LATEST=$(echo "${BRANCH//'/'/-}-latest")

docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"

docker tag "$SOURCE_CONTAINER" "$DOCKER_REPO:$TAG"
docker push "$DOCKER_REPO:$TAG"

docker tag "$SOURCE_CONTAINER" "$DOCKER_REPO:$TAG_LATEST"
docker push "$DOCKER_REPO:$TAG_LATEST"

# push to gcr

# [START auth]
# Decrypt the credentials we added to the repo using the key we added with the Travis command line tool
# If the SDK is not already cached, download it and unpack it
if [ ! -d ${HOME}/google-cloud-sdk ]; then
    curl https://sdk.cloud.google.com | bash;
fi
tar -xzf credentials.tar.gz
mkdir -p lib
# Here we use the decrypted service account credentials to authenticate the command line tool
gcloud auth activate-service-account --key-file jesse-hosted-key.json
# [END auth]

# set the right project
gcloud config set project jesse-hosted
gcloud docker -- push us.gcr.io/jesse-host/"$DOCKER_REPO:$TAG_LATEST"