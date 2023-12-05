#!/bin/bash

TASK=$1

cd ./$TASK
for script_file in `find *.sh -type f | sort -g`; do
    bash $script_file
done
