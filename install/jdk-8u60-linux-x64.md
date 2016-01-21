##linux下java的安装

##应该安装哪个版本(一般指标准环境SE)
1. JDK 适合开发者，已包含JRE
2. Server JRE 适合于部署在服务器端的java程序
3. JRE 适合终端用户只是要运行一下java程序


##安装
1. 请到[http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html)选择合适的版本下载
```
    cd /alidata/java8
    将jdk-8u60-linux-x64.gz放到此目录下
``
2. tar zxvf jdk-8u60-linux-x64.gz
```
    所谓的安装已经完成。
    但是关键是要配置环境变量
```
3. 配置环境变量: 
```
    vim /etc/profile
   在文件末尾加入:
    JAVA_HOME=/alidata/java8/jdk1.8.0_60
    CLASSPATH=/alidata/java8/jdk1.8.0_60/jre/lib/ext
    PATH=/usr/local/mysql/bin:/opt/erlang18/bin:$JAVA_HOME/bin:$PATH
    export PATH JAVA_HOME CLASSPATH
   使新环境变量生效
    . /etc/profile 或者 source /etc/profile
```
4. 验证安装成功,执行
```
    javac   应该提示使用方法
    java -version   应该显示版本信息
```
