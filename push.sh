#!/bin/bash
echo "Start pushing ${PWD##*/}"
docker push junxin/${PWD##*/}
if [ $? != 0  ]; then
  echo "❌  Push failed"
  exit 127
fi
echo "Push end"
