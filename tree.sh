#!/bin/bash

list_recursive()
{
	
	local filepath=$1
	local indent=$2
	
	# 一覧表示インデントを追加
	echo "${indent}${filepath##*/}"
	

	# ディレクトリが存在す場合
	if [ -d "$filepath" ]; then
		
		# 区切りを改行にする
		IFS='
		'
		local fname
		# 階層数分実施
		for fname in $(ls "$filepath")
		do
			# 再度読み出す
			list_recursive "${filepath}/${fname}" "	$indent"
		done

	fi
}

list_recursive "$1" ""
