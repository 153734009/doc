##安装tomcat-8.0.26

1. 到[http://tomcat.apache.org/download-80.cgi](http://tomcat.apache.org/download-80.cgi)下载合适的版本

2. cd /alidata
    tar zxvf apache-tomcat-8.0.26.tar.gz

3. 8.0不修改这个环境变量也能正确运行
```
   修改环境变量
    export CATALINA_HOME=/alidata/apache-tomcat-8.0.26
   使生效
    source /etc/profile
```
4. 启动/关闭 
```
    /alidata/apache-tomcat-8.0.26/bin/startup.sh
    /alidata/apache-tomcat-8.0.26/bin/shutdown.sh
```
5. 正确启动报：
```
    Using CATALINA_BASE:   /alidata/apache-tomcat-8.0.26
    Using CATALINA_HOME:   /alidata/apache-tomcat-8.0.26
    Using CATALINA_TMPDIR: /alidata/apache-tomcat-8.0.26/temp
    Using JRE_HOME:        /alidata/java8/jdk1.8.0_60
    Using CLASSPATH:       /alidata/apache-tomcat-8.0.26/bin/bootstrap.jar:/alidata/apache-tomcat-8.0.26/bin/tomcat-juli.jar
    Tomcat started.
```
6. 访问8080端口，验证正确安装：
    http://192.168.152.5:8080/ 
