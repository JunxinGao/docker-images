#!/bin/bash
source common.sh
set -e
cd $(dirname "$0") #make sure we are in the root of the repo

for d in `ls .`; do
    if [ -f $d/Dockerfile ]; then
      cd $d
      echo "building $d"
      ../build.sh
      if [ $? == 0 ]; then
        echo ".."
        #../push.sh
      fi
      cd ..
    fi
done
