## ctags-5.8 （exuberant ctags）安装使用
ctags（Generate tag files for source code）是vim下方便代码阅读的工具。尽管ctags也可以支持其它编辑器，但是它正式支持的只有VIM。  
“产生标记文件以帮助在源文件中定位对象”  
ctags 最先是用来生成C代码的tags文件，后来扩展成可以生成各类语言的tags, 有些语言也有专有的tags生成工具（比如java的jtags, python的 ptags).  
omnicppcomplete、taglist、showfunc之类的，都是依赖于它的。

1. 到[官网下载](http://ctags.sourceforge.net/)ctags-5.8  
https://ctags.io/  
universal版:https://github.com/universal-ctags/ctags  
exuberant版:http://ctags.sourceforge.net  
```
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
http://prdownloads.sourceforge.net/ctags/ctags58.zip
```

2. windows版本安装
```
因为我使用pathogen管理插件，所以解压的文件夹ctags58/
直接放置到bundle目录下就可以了
```

3. linux版本安装
```
./configure
make
make install
```

### 使用
1. ctags -R /home/www/ (生成指定目录下的tags,对于php默认的该方法不好用，后面有优化)
2. vi –t theTagYourFind (在windows下貌似不适用)
3. :tp(tags preview) 上一个
4. :tn(tags next)下一个
5. :ts(tags list)所有列表
6. Ctrl+] 跳到光标所在函数或类
7. Ctrl+T 返回查找,按原路返回（需要这个快捷键没被占用）
8. :set tags=D:/path/to/project/tags 运行vim的时候，必须在“tags”文件所在的目录下运行。否则需要设置tags读取哪个文件

### omnicppcomplete示例ctags生成语句
ctags -R –c++-kinds=+px –fields=+iaS –extra=+q .
```
-R:ctags循环生成子目录的tags

–c++-kinds=+px :ctags记录c++文件中的函数声明和各种外部和前向声明

–fields=+iaS :ctags要求描述的信息，其中i表示如果有继承，则标识出父类；a表示如果元素是类成员的话，要标明其调用权限（即是public还是private）；S表示如果是函数，则标识函数的signature。

–extra=+q:强制要求ctags做如下操作—如果某个语法元素是类的一个成员，ctags默认会给其记录一行，可以要求ctags对同一个语法元素再记一行，这样可以保证在VIM中多个同名函数可以通过路径不同来区分。
```

##解决ctags对php支持
1. 编辑用户目录.ctags文件
```
vim ~/.ctags
写入合适的正则
--regex-php=/^[ \t]*[(private|public|static)( \t)]*function[ \t]+([A-Za-z0-9_]+)[ \t]*\(/\1/f, function, functions/
--regex-php=/^[ \t]*[(private|public|static)]+[ \t]+\$([A-Za-z0-9_]+)[ \t]*/\1/p, property, properties/
--regex-php=/^[ \t]*(const)[ \t]+([A-Za-z0-9_]+)[ \t]*/\2/d, const, constants/
```

2. 有选择地生成，减小tags文件加快速度
```
ctags --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php
```

3. 使用快捷方式
```
alias ptags='ctags --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php'
```
4. 到项目目录 ptags -R 就能正确生成tags了
