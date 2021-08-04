#!/bin/bash
source common.sh
set -e
cd $(dirname "$0") #make sure we are in the root of the repo

for d in conda; do
    cd $d
    echo "building $d"
    ../build.sh
    if [ $? == 0 ]; then
      ../push.sh
    fi
    cd ..
done
