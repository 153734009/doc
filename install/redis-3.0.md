## redis-3.0安装
@os centos6.6
@since 20160125

1. 下载最新的稳定版 [redis](http://redis.io/download)
```
这里是3.0.6
官网:   http://download.redis.io/releases/redis-3.0.6.tar.gz
github: https://github.com/antirez/redis
```
2. tar -xvf redis-3.0.6.tar.gz

3. cd redis-3.0.6

4. make
```
make test的时候失败了，
Redis的测试用例也就是tests目录下面用的是tcl脚本
```

5. 确认安装成功  
/opt/redis-3.0.6/src/redis-server -v

6. 启动服务
```
redis-3.0.6/src/redis-server
这时运行的是默认配置 redis-3.0.6/redis.conf
```

7. phpredis
```
http://pecl.php.net/package/redis
https://github.com/phpredis/phpredis
```

###配置说明
1. daemonize no 是否守护进程的方式运行
2. pidfile /var/run/redis.pid 
3. prot 6379 监听的端口
4. bing 127.0.0.1 绑定主机地址

### 安装tcl
1. 去[ActiveState官网](http://downloads.activestate.com/)下载
```
http://downloads.activestate.com/ActiveTcl/releases/8.6.4.1/ActiveTcl8.6.4.1.299124-linux-x86_64-threaded.tar.gz
```
