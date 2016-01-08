##安装nginx web服务器##
@enviroment CentOS-6.6  64bit
@author     153734009
@since      2015年12月31日  

----------
1. tar -xvf /download/nginx-1.9.9.tar.gz

2. cd nginx-1.9.9

3. 选择性安装一些扩展
./configure  
--prefix=/alidata/nginx-1.9.9 指定安装目录   
--with-stream tcp代理支持  
--with-zlib=../zlib-1.2.6 压缩模块  
--add-module=/home/src/fastdfs-nginx-module/src 分布式文件（图片 视频）模块  
--with-http_ssl_module  
--with-http_dav_module  
--with-http_flv_module  
--with-http_realip_module  
--with-http_gzip_static_module  
--with-http_stub_status_module  
--with-mail  
--with-mail_ssl_module  
--with-pcre=../pcre-8.30  
--http-client-body-temp-path=/var/tmp/nginx/client  
--http-proxy-temp-path=/var/tmp/nginx/proxy  
--http-fastcgi-temp-path=/var/tmp/nginx/fastcgi  
--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi  
--http-scgi-temp-path=/var/tmp/nginx/scgi  
--with-http_sub_module  
--with-debug  
--add-module=/home/src/ngx_http_substitutions_filter_module  
--add-module=/home/src/echo-nginx-module-0.58  

4. make

5. make install

6. 上传"nginx"shell文件到 /etc/init.d/目录下  
实现 start stop restart

7. 修改配置文件  
/alidata/nginx-1.9.9/conf/nginx.conf  
```
小公司一般会增加vhost目录，支持多网站
include /alidata/nginx-1.9.9/conf/vhosts/*.conf;
```

8. 启动服务
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
