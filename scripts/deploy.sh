#!/bin/bash

echo "pushing container"

set -x

SOURCE_CONTAINER=${1}
DOCKER_REPO=${2}
BRANCH=${3}
VERSION=${4}

TAG=$(echo "${BRANCH//'/'/-}-${VERSION}")
TAG_LATEST=$(echo "${BRANCH//'/'/-}-latest")

docker-compose -f docker-compose.yml build

# push to gcr

# [START auth]
# Decrypt the credentials we added to the repo using the key we added with the Travis command line tool
# If the SDK is not already cached, download it and unpack it
if [ ! -d ${HOME}/google-cloud-sdk ]; then
    curl https://sdk.cloud.google.com | bash;
fi
tar -xzf credentials.tar.gz
# Here we use the decrypted service account credentials to authenticate the command line tool
gcloud auth activate-service-account --key-file jesse-hosted-key.json
# [END auth]

# set the right project
gcloud config set project jesse-hosted
docker tag "$SOURCE_CONTAINER" us.gcr.io/jesse-hosted/"$DOCKER_REPO:$TAG_LATEST"
docker image ls
gcloud docker -- push us.gcr.io/jesse-hosted/"$DOCKER_REPO:$TAG_LATEST"