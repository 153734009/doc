##vim插件 taglist_46的安装使用
TagList插件,是一款基于ctags,在vim代码窗口旁以分割窗口形式显示当前的代码结构概览,增加代码浏览的便利程度的vim插件。

1. 到官网下载[taglist_46插件](http://www.vim.org/scripts/script.php?script_id=273)

2. unzip taglist_46.zip
```
得到：
taglist_46
    doc
        taglist.txt
    plugin
        taglist.vim
```

3. 安装
```
因为我使用pathogen管理插件，直接放置到bundle目录下就可以了
如果没有安装插件管理:
cp  doc/taglist.txt  /your/vim/vim74/doc/
cp  plugin/taglist.vim  /your/vim/vim74/plugin/
```

4. 常用设置
```
let Tlist_Ctags_Cmd = 'D:/ctags.exe'    "注意斜杠 特殊符号 和中文很可能不能识别
let Tlist_Auto_Open = 0             "不使用自动打开
let Tlist_Show_One_File = 1         "只显示当前文件的tags
let Tlist_WinWidth=30               "设置taglist宽度
let Tlist_Exit_OnlyWindow = 1       "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1        "在Vim窗口右侧显示taglist窗口
let Tlist_Sort_Type="name"          "以tag名字进行排序,默认是出现顺序order
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时,焦点在其上
let Tlist_Close_On_Select=0     "选择后，不自动关闭
```

5. 设置在新tab中打开
```
:nnoremap <F3> <C-w><C-]><C-w>T
本质是使用 ctrl+w 控制窗体
```

###常用的命令
1. TlistOpen
2. TlistClose
3. TlistToggle
4. Ctrl-ww (C+连按2下w, 切换窗口，因为它也是vim分隔窗口)

###Taglist窗口中的主要操作
1. o 新建一个窗口，跳到标记定义处
2. p 当前窗口，调到比较定义处
3.   空格显示标记的原型
4. u 更新标记文件
5. s 选择排序字段
6. d 删除光标所在的taglist文件（慎用）。再次显示需要关闭vim重新打开
7. x 放到/缩小taglist窗口
8. \+ 展开
9. \- 折叠
10. \* 全部展开
11. = 全部折叠
12. [[ 将光标移到前一个文件的起点，
13. ]] 后一个文件的起点。 Tlist_Show_One_File!=1时
14. q 推出taglist窗口

