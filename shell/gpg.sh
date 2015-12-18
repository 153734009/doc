#!/bin/bash
# Encrypt file with vim

#for file in *.txt ; do encrypt test $file ; done
function batch_encrypt() {
	for file in `ls $1`
	do
        targetDir=$1/
        targetDir=/git/AnolePHP${targetDir#*AnolePHP_SVN}
		if test "$file" = ".svn"
		then
			echo '跳过.svn'
        #elif test "$file" = "core"
        #then
        #    echo '跳过core'
		elif [ -d $1"/"$file ]
		then
			batch_encrypt $1"/"$file $2
		elif test "${file##*.}" = 'php'
		then
            if [ ! -d "$targetDir" ]; then
              mkdir -p $targetDir
            fi
            #解密：gpg --batch  --passphrase yourpwd -d -o f f.enc
            `gpg -c --batch --passphrase $2 -o $targetDir$file.enc $1"/"$file`
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
batch_encrypt $dir $1
echo '谢谢'
