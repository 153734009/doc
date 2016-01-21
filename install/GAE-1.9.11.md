##GAE-1.9.11 SDK
win7 201409025

1. 到 https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP
   下载最新的 GoogleAppEngine-1.9.11.msi 【记得下载2.7.x版本的 python(非常重要)】
   到 https://www.python.org/download/releases/2.7.4
   下载特定版本 Windows X86-64 MSI Installer (2.7.4) [1] (sig)

2. 安装 python 到 d:\gae\Python27\
   安装 GoogleAppEngine 到 d:\gae\google_appengine\

3. 启动 GoogleAppEngine 环境。 每次启动都好慢，以为它死了，请耐心等待。
```
   当然也可以从cmd 开启监听端口。
   启动后看到一个很搓的界面，以为它不能用，其实是需要配置  python 所在。
   edit -> preferences 打开配置界面：
	Python Path ：（重要，我的python装在d:\gae\Python27\python.exe）,所以填上此路径
	App Engine SDK ：（SDK 所在的目录，一般不用设置）
	Editor ：(设置你顺手的代码编辑器IDE,我的是C:\Program Files\Vim\vim74\gvim.exe)
	Deployment Server : (软件建议别设置)
```
4. 环境其实是OK了 ，让我们上helloworld来验证一下。

5. 新建一个项目文件夹 d:\gae\helloworld\ 。
```
	a.项目文件夹下创建 helloworld.php 文件，代码入下：
	╔═══════════════════════════════╗
	║ <?php							║
	║	  echo 'Hello, World!';		║
	╚═══════════════════════════════╝
	<?php
	  echo 'Hello, World!';
	b.项目文件夹下创建配置文件 app.yaml 文件（重要），配置入下：
	╔═══════════════════════════════╗
	║	application: helloworld		║
	║	version: 1					║
	║	runtime: php				║
	║	api_version: 1				║
	║								║
	║	handlers:					║
	║	- url: /.*					║
	║	  script: helloworld.php	║
	╚═══════════════════════════════╝
```
6. file -> Add Existing Application
```
	把刚写的这个helloworld项目添加进来，指明访问端口（我随便设8180） 
	和 管理关口（8100）端口不冲突就行了
```
6.5 也能从cmd开启服务 dev_appserver.py d:\gae\helloworld
```
	注意 dev_appserver.py 的路径正确 和 项目路径正确d:\gae\helloworld
	注意 cmd 打开的默认端口是：8080 和 8000
```

7. 打开浏览器，访问成功。




##增加对静态文件的支持
```
    application: helloworld
		version: 1
		runtime: php
		api_version: 1
		
		handlers:
	╔═══════════════════════════════╗
	║	- url: /stylesheets			║
	║	  static_dir: stylesheets	║
	╚═══════════════════════════════╝

		- url: /.*
		  script: helloworld.php
```
