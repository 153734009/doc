##amqp扩展安装
@php    5.6
@since  2016年01月23日

### 先安装依赖librabbitmq
1. 到github上下载最新版的 [rabbitmq-c](https://github.com/alanxz/rabbitmq-c) 当前是v0.7.1
2. tar -xvf rabbitmq-c-0.7.1.tar.gz
3. cd rabbitmq-c-0.7.1
4. autoreconf -i
5. ./configure
6. make
7. make install
8. 检验扩展是否正确安装
```
./examples/amqp_sendstring localhost 5672 amq.direct test "hello world"
执行后可以通过看 
http://127.0.0.1:15672 网页界面查看
或者 之前起的服务 rabbitmq-server 的shell下查
```

### 到pecl下载[amqp扩展](http://pecl.php.net/package/amqp)
1. 选择最新版本[amqp-1.7.0alpha2.tgz](http://pecl.php.net/get/amqp-1.7.0alpha2.tgz)
2. tar -xvf amqp-1.7.0alpha2.tgz
3. cd amqp-1.7.0alpha2
4. phpize
5. ./configure --with-php-config=/usr/local/php55/bin/php-config
6. make
7. 将编译好的amqp.so文件放到php目录下
```
/usr/local/php/lib/php/extensions/no-debug-non-zts-20121212/
make install
````
8. 修改配置文件/usr/local/php/etc/php.ini
```
增加一行配置：
extension=amqp.so
```
9. 重启php-fpm 
```
/etc/init.d/php-fpm restart
需要你之前有把php-fpm的启动脚本放到/etc/init.d/目录下
```
10. 查看phpinfo();证实amqp扩展已安装
