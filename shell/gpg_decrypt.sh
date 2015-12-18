#!/bin/bash
# Encrypt file with vim

function batch_decrypt() {
	for file in `ls $1`
	do
        targetDir=$1/
        targetDir=/git/AnolePHP_DEC${targetDir#*AnolePHP}
		if test "$file" = ".git"
		then
			echo '跳过.git'
		elif [ -d $1"/"$file ]
		then
			batch_decrypt $1"/"$file $2
		elif test "${file##*.}" = 'enc'
		then
            if [ ! -d "$targetDir" ]; then
              mkdir -p $targetDir
            fi
            file=${file%.enc} #最小限度从后面截取word
            `gpg --batch  --passphrase $2 -d -o $targetDir$file $1"/"$file.enc`
        else
            if [ ! -d "$targetDir" ]; then
              mkdir -p $targetDir
            fi
            #echo 1 > /root/null
            `cp $1"/"$file $targetDir$file`
		fi
	done
}

#./gpg.sh password
dir=$(pwd)
#命令后跟参数，参数不定，在里面使用$#表示变量数
#$1 $2表示第几个参数
batch_decrypt $dir $1
echo '谢谢'
