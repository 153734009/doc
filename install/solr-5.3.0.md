安装solr-5.3.0
===================================
1. 到[http://www.apache.org/dyn/closer.lua/lucene/solr/5.3.0](http://www.apache.org/dyn/closer.lua/lucene/solr/5.3.0)选择下载最新的版本

2. cd /opt/
    wget http://mirrors.cnnic.cn/apache/lucene/solr/5.3.0/solr-5.3.0.zip

3. unzip solr-5.3.0.zip

4. 启动solr
    /opt/solr-5.3.0/bin/solr start
    这个是默认启动，监听8983端口。

5. 验证安装成功
    访问[http://192.168.152.5:8983/](http://localhost:8983/)
    可见solr的界面

6. 该种方式是jetty servlet嵌入式，而不是web应用式。




将solr-5.3.0部署到Tomcat下
===================================
1. 将solr中的webapp目录拷贝到tomcat webapps目录下
    cp -R /opt/solr-5.0.3/server/solr-webapp/webapp /alidata/apache-tomcat-8.0.26/webapps/solr
    所起的solr目录名是可以随意的，这里用solr比较自然

2. 将需要的第三方库也拷贝到tomcat solr项目下
    cd /opt/solr-5.3.0/server/lib/ext
    cp *.jar /alidata/apache-tomcat-8.0.26/webapps/solr/WEB-INF/lib

3. 将日志功能也拷贝到tomcat solr项目下
    cp /opt/solr-5.3.0/server/resources/log4j.properties /alidata/apache-tomcat-8.0.26/webapps/solr/WEB-INF/lib

4. 将/opt/solr-5.3.0/server/solr目录拷贝到/data/solr下做为solr的工作目录
    cp -R /opt/solr-5.3.0/server/solr /data/solr

5. 修改web配置信息
    去掉注释开启配置，指定solr工作目录
    vim /alidata/apache-tomcat-8.0.26/webapps/solr/WEB-INF/web.xml
    <env-entry>
       <env-entry-name>solr/home</env-entry-name>
       <env-entry-value>/data/solr/</env-entry-value>
       <env-entry-type>java.lang.String</env-entry-type>
    </env-entry>

6. 重启tomcat
    http://192.168.152.5:8080/solr 验证已部署成功

7. 文档请看
    [http://mirrors.cnnic.cn/apache/lucene/solr/ref-guide/apache-solr-ref-guide-5.3.pdf](http://mirrors.cnnic.cn/apache/lucene/solr/ref-guide/apache-solr-ref-guide-5.3.pdf)
