#!/bin/bash

# 日記データディレクトリ
directory="./diary"

if [ ! -d "$directory" ]; then
	mkdir "$directory"
fi

file="${directory}/$(date '+%Y-%m-%d').txt"

if [ ! -e "$file"  ]; then
	date '+%Y-%m-%d' > "$file"　
fi

vim "$file"

