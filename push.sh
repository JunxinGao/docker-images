#!/bin/bash
echo "Start pushing ${PWD##*/}"
docker push junxin/${PWD##*/}
if [ -f .TAG ]; then
  TAG=`head -n +1 .TAG`
else
  TAG=$(date +%F)
fi
docker push junxin/${PWD##*/}:$TAG
if [ $? != 0  ]; then
  echo "❌  Push failed"
  exit 127
fi
echo "Push end"
