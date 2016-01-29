:%!xxd		    "转化成16进制显示
:%!xxd -r	    "恢复字符显示
:%s/\(\w\+\), \(\w\+\)/\2 \1/   将 Doe, John 修改为 John Doe	"分组后向引用
:%s/^\s\+$//    "去除空行中的空格
:g/^$/d         "去空行
:g /^\n/d       同上
:%s/\n\{3,\}/\r\r/	    "去多行空行，留1行
"\n 表示换行, \{3,\} 表示三个以上的, 也就是超过两个空行, 
"替换部分匹配换行的是 \r 不是 \n，和查找不一样
替换成两个 \r (换行在替换的时候就是这样, 前面要用 \n, 后面要用 \r)
:%s= *$==       "将所有行尾多余的空格删除
ctrl+q          "块操作
a10yy	        "夸文件多行复制
ap

代码折叠
manual	    手工定义折叠
indent		更多的缩进表示更高级别的折叠
expr		用表达式来定义折叠
syntax		用语法高亮来定义折叠
diff		对没有更改的文本进行折叠
marker		对文中的标志折叠

:s%/\n/\r\r/gc       增加一空行，方便阅读
9. 递增 插入
   let i=0 | g/toPlaced/s//\=i/ |let i=i+1
10. 宏录制（调用 6@a ）
   qa 动作 q 
   qa dw j q	=>	6@a
11. 换行符
   \r => ^M
   :%s/\n\n/\r/g "连续的两个空行替换成一个空行
12. <list mode>
   :set list	 :set nolist "可以清楚的看到以“$”表示的换行符和以“^I”表示的制表符

13. 编码查看设置问题
   :set fileencoding(等价于fenc)	"查看当前文件编码
   :set fenc=utf-8	:w 				"设置编码 然后:w就把文件存成utf-8
   :set fileencodings(等价于fencs)=utf-8,gb2312,gbk,gb18030,big5	
   :set enc=utf-8
   "是用来在打开文件的时候进行解码的猜测列表。文件编码没有百分百正确的判断方法，所以vim只能猜测文件编码。
   "enc，其作用是显示, 不管最后的文件是什么编码的，vim都会将其转换为当前系统编码来进行处理，这样才能在当前系统里面正确地显示出来。
   "在windows下面，enc默认是cp936，这也就是中文windows的默认编码。
   "在 linux下，随着你的系统locale可能设为zh_CN.gb18030或者zh_CN.utf-8，你的enc要对应的设为gb18030或者 utf-8(或者gbk之类的)。
14. 
   :shell 可以在不关闭vi的情况下切换到shell命令行
   :exit 从shell回到vi

15. 多标签
   直接在编辑的时候输入：
   vim -p 要编辑的文件名
   如vim -p * 就是编辑当前目录的所有文件
   多个标签间进行切换时向右切换gt，向左切换用gT
   在编辑的时候想增加一个标签就可以:tabnew filename
   :tabc       关闭当前的tab
   :tabo       关闭所有其他的tab
   :tabs       查看所有打开的tab
   :tabp      前一个
   :tabn      后一个"

16 快速操作引号内内容
   ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
   di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
   yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
   vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容

17 多文件替换(arg) 
   a、加入要处理的文件  :args *.txt
   b、输入对上述文件的动作  :argdo %s/hate/love/gc | update  （这里将hate替换成love，update表示要写入到文件中，否则只作替换而不写入）

18 多文件查找
   	:vimgrep /匹配模式/[g][j] 要搜索的文件/范围 
   	:vim[grep][!] /{pattern}/[g][j] {file} ...
   例：
   	:vimgrep /\<flash\>/ **/*.as 搜索当前目录以及所有子目录内as文件中的 "flash"
   	:vimgrep /an error/ *.c 就是在所有的.c文件中搜索an error。
   	:vimgrep/an error/* 意思是查找当前目录下的文件中的an error，不包括子目录
   定位 
      输入上述的命令后，可以像输入:make命令，那样定位匹配到的文件位置 
      :cnext (:cn)           下一个匹配位置
      :cprevious (:cp)     上一个匹配位置
      :cwindow (:cw)     quickfix窗口，可以选择匹配的文件位置
      :cl(:clist)

19 最小匹配 /a.\{-}b  (normal mode commandddd)
   贪婪匹配 /a.*b
   它会匹配到"axbxb"中的"axb".

20 使用gf 进行文件跳转，前提是需要完整的文件路径如 D:\wnmp\www\i.php
   ctrl+w +g 可以在新窗口中打开
   :e# 可以后退到上一个文件

21 复制到系统黏贴板
   "+y 

22 vim 命令加密
   vim -e -s -c ":set key=0" -c ":wq" 1.txt
   -e ex模式（命令模式）
   -s 安静(批处理)模式 (只能与 "ex" 一起使用)
   0是你的密码；1.txt是你要加密的文件
