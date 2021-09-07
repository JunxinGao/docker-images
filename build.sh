#!/bin/bash

if [ -f .TAG ]; then
  TAG=`head -n +1 .TAG`
else
  TAG=$(date +%F)
fi
echo $TAG

echo "Building ${PWD##*/}:$TAG ..."

docker build . -t junxin/${PWD##*/}:latest -t junxin/${PWD##*/}:$TAG -f Dockerfile

if [ $? != 0 ]; then
  echo "❌  Build failed"
  exit 127
fi
echo "Build end"
