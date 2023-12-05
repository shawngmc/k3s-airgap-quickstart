#!/bin/bash

TASK=$1

for script_file in `find ./$TASK/* -type f | sort -g`; do
    bash $script_file
done