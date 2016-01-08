##nginx新增模块
nginx version: nginx/1.9.4  
built by gcc 4.4.7 20120313 (Red Hat 4.4.7-11) (GCC)  

###一. 重新编译  
1. 进入原先编译nginx的目录
~~~
cd /download/nginx-1.9.9
~~~

2. 获取原来的编译参数
~~~
/alidata/nginx/sbin/nginx -V
如下：
--prefix=/alidata/nginx
~~~

3. 增加响应的编译参数
~~~
/download/nginx-1.9.9/configure --help
查看默认可以添加的模块
这里以 stream 模块为例，增加编译参数
./configure --prefix=/alidata/nginx --with-stream
~~~

4. stream的配置请参考官网  
[http://nginx.org/en/docs/stream/ngx_stream_core_module.html]

5. 编译 然后移动覆盖原来的nginx
~~~
make
这样会在生成可执行文件nginx在 /download/nginx-1.9.9/objs/目录下
mv /download/nginx-1.9.9/objs/nginx /alidata/nginx-1.9.9/sbin/nginx
~~~

###二. 增加
--add-module=PATH   enable an external module
