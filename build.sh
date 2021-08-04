#!/bin/bash

echo "Start building ${PWD##*/}"
echo ${PWD##*/}:latest
docker build . -t junxin/${PWD##*/}:latest -t junxin/${PWD##*/}:$(date +%F) -f Dockerfile
if [ $? != 0 ]; then
  echo "❌  Build failed"
  exit 127
fi
echo "Build end"
