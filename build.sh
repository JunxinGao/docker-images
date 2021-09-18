#!/bin/bash

BUILD_TAG_FILE="build_tag"

if [ -f $BUILD_TAG_FILE ]; then
  BUILD_TAG=`head -n +1 $BUILD_TAG_FILE`
else
  BUILD_TAG=$(date +%F)
fi

IMAGE_NAME=junxin/${PWD##*/}

echo "Building ${PWD##*/}:$BUILD_TAG ..."

if [ ! -f Dockerfile ]; then
  echo "Dockerfile.build <- ../Dockerfile ..."
  cat ../Dockerfile > Dockerfile.build
else
  cat Dockerfile > Dockerfile.build
fi

if [ -f common_install ]; then
  for line in $(cat common_install)
  do
    install_mod="../$line/Dockerfile.install"
    if [ -f $install_mod ]; then
      echo "Dockerfile.build <- $install_mod ..."
      echo "" >> Dockerfile.build
      cat $install_mod >> Dockerfile.build
    else
      echo "$install_mod not exist"
    fi
  done
fi

if [ -f Dockerfile.install ]; then
  echo "" >> Dockerfile.build
  cat Dockerfile.install >> Dockerfile.build
fi

if [ -f Dockerfile.end ]; then
  echo "" >> Dockerfile.build
  cat Dockerfile.end >> Dockerfile.build
fi

if [ -f base_image ]; then
  docker build . -t $IMAGE_NAME:latest -t $IMAGE_NAME:$BUILD_TAG --build-arg BASE_IMAGE=$(<base_image) -f Dockerfile.build
else
  docker build . -t $IMAGE_NAME:latest -t $IMAGE_NAME:$BUILD_TAG -f Dockerfile.build
fi

if [ $? != 0 ]; then
  echo "❌  Build failed"
  exit 127
else
  echo "Build end"
fi
