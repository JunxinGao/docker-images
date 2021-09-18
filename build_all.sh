#!/bin/bash
source common.sh
set -e
cd $(dirname "$0") #make sure we are in the root of the repo

for d in `ls .`; do
    if [ -f $d/Dockerfile -o -f $d/Dockerfile.install -o -f $d/common_install ]; then
      cd $d
      echo "✈️   building $d"
      ../build.sh
      if [ $? == 0 ]; then
        ../push.sh
      fi
      cd ..
    fi
done
