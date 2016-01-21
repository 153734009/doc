source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


"+--------------------------------------------+
"    new setting
"+--------------------------------------------+
"解决乱码问题
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8
set shortmess=atI   "启动的时候不显示援助乌干达儿童的提示
set nobackup
set nu
winpos 5 5
set lines=44 columns=155
set guifont=Courier_New:h12:cANSI "设置字体
set foldenable      "允许折叠
set ruler
set go=             "去掉按钮菜单
color evening       "设置配色风格
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"20%y/%m/%d\-\%H:%M\")} "状态行显示的内容
set nocompatible "去掉有关VI一致性模式，避免以前版本的一些bug和局限
set ts=4            "tabstop设置为4个空格宽度
set shiftwidth=4    "设置 =自动= 缩进所使用的空白长度
set softtabstop=4   "上面2项的混合使用
set expandtab       "以空格替换tab
set fileformats=unix,dos "自动识别UNIX格式和MS-DOS格式,的结尾
"设置 ' " ( [ 的自动补全
:inoremap ( ()<ESC>i
:inoremap [ []<ESC>i
:inoremap < <><ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap ] <c-r>=ClosePair(']')<CR>
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
"按%在 html标签跳转
runtime macros/matchit.vim 
filetype plugin on 
 
"+--------------------------------------------+
"键盘命令
"imap和smap	可以分别在输入模式和选择模式时去映射
"+--------------------------------------------+
"自动补大括号
imap { {<CR>}<ESC>kA<CR>


source $VIM/tags.vim
source $VIM/NERDTree.vim
source $VIM/jsbeautify.vim
source $VIM/md.vim
