#!/bin/bash
IMAGE_NAME=junxin/${PWD##*/}
echo "Start pushing $IMAGE_NAME:latest"
docker push $IMAGE_NAME:latest

if [ -f build_tag ]; then
  TAG=`head -n +1 build_tag`
else
  TAG=$(date +%F)
fi
echo "Start pushing $IMAGE_NAME:$TAG"
docker push $IMAGE_NAME:$TAG
if [ $? != 0  ]; then
  echo "❌  Push failed"
  exit 127
fi
echo "Push end"
