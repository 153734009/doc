##git常用的基本命令
1. git branch 查看本地分支
2. git branch -a 查看全部分支（远程分支）
3. git branch -d b1 删除本地分支
4. git branc -r -d origin/b1 删除远程分支  
git push origin :b1  
或 git push origin --delete b2
5. 删除文件
```
git status 查看所做的修改
git rm .vmware_bridge.md.swp 删除指定文件
git commit am 删除所有物理删了的文件
```

