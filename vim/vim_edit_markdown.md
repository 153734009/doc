##vim编辑Markdown使用chrome实时预览

### 语法高亮（vim-markdown）
1. 到https://github.com/plasticboy/vim-markdown去下载
2. 因为我之前使用了插件管理器pathogen,所以只要把插件文件夹下载放到 Vim\vimfiles\bundle 目录下
```
cd ~/.vim/bundle
git clone https://github.com/plasticboy/vim-markdown.git
```
3. 设置快捷键预览（需要安装chrome插件）
```
" 在浏览器预览 for win32; 注意斜杠方向
function! ViewInBrowser(name)
    let file = expand("%:p")
    exec ":update " . file
    let l:browsers = {
        \"cr":"C:/Program Files (x86)/Google/Chrome/Application/chrome.exe",
        \"ff":"D:/Program Files (x86)/Mozilla Firefox/firefox.exe",
    \}
    exec ":silent !start " .l:browsers[a:name]. ' 'file
endfunction
nmap <f12> :call ViewInBrowser("cr")<cr>
nmap <f12>ff :call ViewInBrowser("ff")<cr>
```

###chrome插件 markdown preview plus
1. 打开谷歌浏览器设置界面chrome://settings/
2. 选择 “扩展程序” 选项卡
3. 搜索 “Markdown Preview Plus”
4. 选中安装
