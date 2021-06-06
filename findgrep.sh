#!/bin/bash

usage()
{
	# シェルスクリプトのファイル名を取得
	local script_name=$(basename "$0")
	
	# ヒアドキュメントでヘルプを表示
	cat << END

Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
Find file in current directory recursively, and print line which match PATTERN.
	
	PATH 	find file in PATH directory, instead of current directory
	NAME_PATTERN specify naem patten to find file

Exanple:
  $script_name retrun
  $script_name return ~ "*.txt"
END
}


# コマンドライン引数が0個のとき
if [ "$#" -eq 0  ]; then
	usage
	exit 1
fi


pattern=$1 # 検索パターン
directory=$2 # 起点ディレクトリ
name=$3    # 検索ファイルパターン

# 第2引数がから文字のとき
if [ -z "$directory" ]; then
	directory='.'
fi

# 第3引数がから文字のとき
if [ -z name  ];then
	name="*"
fi

# 検索ディレクトリが存在しない場合はエラーメッセージを表示して終了
if [ !  -d "$directory" ]; then
	echo "$0: ${directory}: No such directory" 1>&2
	exit 2
fi

find "$directory" -type f -name "$name" | xargs grep -nH "$pattern"
