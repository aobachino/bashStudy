#!/bin/bash

echo "start bash";
echo 

echo ${HOME}

directory="/home/kali/Desktop/study/demo"
if [ ! -d "$directory"  ]; then
	mkdir "$directory"
fi

#ホームディレクトリに移動して出力する
cd /

echo
ls -a # フォルダのリストを取得

echo
# 変数文字列出力
country=Japan
echo 'I came from $country'
echo "I came from $country"
echo "I came from \$country"

echo
# 変数をコマンド置換する
filename=$(date '+%Y-%m-%d')

echo $filename
touch "${directory}/${filename}.txt"

echo
# 位置パラメータで引数を見る
echo "\$0 = $0"
echo "\$1 = $1"
echo "\$2 = $2"
echo "\$3 = $3"

echo
# 条件分岐例
filename=$1
if [ -z "$filename" ]; then
	filename="non";
else 
   	filename="input"
fi

echo $filename

echo
filedir=$(pwd)
if [ -d "$filedir" ]; then
	echo exit dir
else 
	echo non dir
fi

echo
int0=0
int1=1

if [ "$int0" -le 0 ]  &&  [ "$int0" -lt "$int1" ]; then
	echo zero
fi

echo
[  -f demo.sh ]  && cat demo.sh 

echo
# for文の実装処理
for i in $(seq 1 5)
do
	touch "${directory}/000${i}.txt"

done

echo 
for str in aaa bbb ccc 
do
	echo $str
done

# case文の自走処理
case "$1" in
	*.txt)
		less "$1"
		;;
	*.sh)
		vim "$1"
		;;
	*)
		echo "not supported faile : $1"
		;;
esac

case "$1" in
	start|stop)
		echo "OK"
	;;

	*)
		echo "NG"
	;;
esac





echo
echo "finish bash";
