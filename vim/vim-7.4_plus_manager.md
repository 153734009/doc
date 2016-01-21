##vim-7.4 插件管理

###pathogen[管理插件的插件]
1. 下载地址
    [https://github.com/tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)

2. 将插件 pathogen.vim 放在 ~vim/vimfiles/autoload 中

3. 建立文件夹  ~vim/vimfiles/bundle/ 用来放置插件

4. 新的插件放置到bundle目录下
```
    结构如下
   |-----------------------------------| 
   | vimfile                           | 
   |     bundle                        | 
   |         nerdtree    目录结构插件  | 
   |         ctags58     标签插件      | 
   |         command-t   定位跳转插件  | 
   |-----------------------------------| 
```



###常用插件分类
1. 通用插件：
    适用于所有类型的文件，在使用Vim的时候可以通过插件命令呼出。比如用来快速定位文件的插件CommandT，使用:CommandT即可启动该功能，对任何类型都适用。该类插件一般放置在.vim/plugin/目录下。
2. 文件类型插件：
    适用于特定类型的文件，比如c、java、xml等文件。在编辑特定类型的文件时，插件功能才会启用，该类插件一般放置在.vim/ftplugin/目录下。比如我们常用的编辑xml/html/jsp等文件的插件xmledit，安装了该插件后，编辑xml文件时，键入<modules>，当完成了最后的>时，xmledit会自动为你添加闭合标签，<modules></modules>，如果输入了最后一个>，标签会自动展开，方便输入子标签或文本内容。这时如果你用Vim打开一个txt文件，这些功能就消失了。当然，xmledit功能远不止这么简单，我们稍后再详细介绍。
3. 语法插件：
    顾名思义，语法插件主要为编程语言提供语法高亮功能，一般放置在.vim/syntax/下。Vim已经默认提供了大部分语言的语法高亮功能，但对于一些比较新的语言，就需要开发者编写支持语法高亮的插件，比如Go语言。
4. 编译器插件：
    针对不同语言编写的编译器插件，主要用来设定相关语言的编译器选项。比如针对C、C++、Java、Python等可以编写各自的编译器插件，插件内容并不复杂，主要定义"errorformat"（错误格式定义）及"makeprg"（编译程序和参数）的内容即可。通过:make可以编译正在编辑的文件。
