#!/bin/bash

if [ -f .TAG ]; then
  TAG=`head -n +1 .TAG`
else
  TAG=$(date +%F)
fi

IMAGE_NAME=junxin/${PWD##*/}

echo "Building ${PWD##*/}:$TAG ..."

docker build . -t $IMAGE_NAME:latest -t $IMAGE_NAME:$TAG -f Dockerfile

if [ $? != 0 ]; then
  echo "❌  Build failed"
  exit 127
fi
echo "Build end"
