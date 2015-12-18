#!/bin/bash
# Encrypt file with vim

#for file in *.txt ; do encrypt test $file ; done
function batch_encrypt_by_vim() {
	for file in `ls $1`
	do
		if test "$file" = "vendor"
		then
			echo '跳过vendor'
		elif [ -d $1"/"$file ]
		then
			batch_encrypt_by_vim $1"/"$file
		elif test "${file##*.}" = 'php'
		then
			vim -e -c ":set key=yourpsw" -c ":wq" $1"/"$file
			echo $1"/"$file
		else
			echo '跳过非php文件'
		fi
	done
}

dir=$(pwd)
batch_encrypt_by_vim $dir
