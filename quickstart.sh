#!/bin/bash

set -e

TASK=$1

if [ -z ${GAP_DIR} ]; then
  export GAP_DIR=$(dirname $(realpath "$0"))/gapfiles
fi

cd ./$TASK
for script_file in `find *.sh -type f | sort -g`; do
    bash $script_file
done
