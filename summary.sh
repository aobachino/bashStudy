#!/bin/bash

file="$1"

for file in "$@"
do
   # パラメータがディレクトリか判定
   if [ -d "$file" ]; then
           echo "$file is a directory"
	   ls "$file"
    elif [ -f "$file" ]; then
            echo "$file is a file"
	    head -n 5 "$file"
    fi
    echo ----------------------------------------------------
done

