##erlang18.0 + rabbitMQ3.5.4
@since  2016年01月23日

###可以考虑使用kerl简化安装（https://github.com/yrashk/kerl）

1. 进入你经常保持下载的目录 
```
    cd /root/download
    curl -O https://raw.githubusercontent.com/yrashk/kerl/master/kerl
    chmod a+x kerl
```
2. 检查可用的版本
```
    /root/kerl list releases
    [root@eelly ~]# /root/kerl list releases
    R10B-0 R10B-10 R10B-1a R10B-2 R10B-3 R10B-4 R10B-5 R10B-6 R10B-7 R10B-8 R10B-9 R11B-0 R11B-1 R11B-2 R11B-3 R11B-4 R11B-5 R12B-0 R12B-1 R12B-2 R12B-3 R12B-4 R12B-5 R13A R13B01 R13B02-1 R13B02 R13B03 R13B04 R13B R14A R14B01 R14B02 R14B03 R14B04 R14B_erts-5.8.1.1 R14B R15B01 R15B02 R15B02_with_MSVCR100_installer_fix R15B03-1 R15B03 R15B R16A_RELEASE_CANDIDATE R16B01 R16B02 R16B03-1 R16B03 R16B 17.0-rc1 17.0-rc2 17.0 17.1 17.3 17.4 17.5 18.0
    Run "/root/kerl update releases" to update this list from erlang.org
```
3. 创建安装包,选择要安装的版本
```
    （会花很长很长时间）
    /root/kerl build 18.0 18.0
```
4. 安装  
    /root/kerl install 18.0 /opt/erlang18

5. 使生效
```
    . /opt/erlang18/activate
    验证已生效： erl -version
    输出：Erlang (SMP,ASYNC_THREADS,HIPE) (BEAM) emulator version 7.0
```
6. erl进入后，查看服务器状态
```
    spawn(fun() -> etop:start([{output, text}, {interval, 20}, {lines, 20}, {sort, memory}]) end). 
```

7. 退出erlang shell
```
halt().
init:stop().
Control+c，然后选a
Control+c，然后选q
```

###直接使用Binary文件 [rabbitMQ3.5.4](http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.4/rabbitmq-server-generic-unix-3.5.4.tar.gz)
1. cd /root/download
```
    wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.4/rabbitmq-server-generic-unix-3.5.4.tar.gz
```
2. tar -xvf rabbitmq-server-generic-unix-3.5.4.tar.gz

3. mv rabbitmq_server-3.5.4 /usr/local/rabbitmq_server-3.5.4

4. app形式运行:
```
    /usr/local/rabbitmq_server-3.5.4/sbin/rabbitmq-server
   app形式运行(后台运行):
    /usr/local/rabbitmq_server-3.5.4/sbin/rabbitmq-server -detached
    到这里如果出现一个报错信息： ./rabbitmq-server: line 86: erl: command not found  
    这是因为erlang指定了安装路径，在系统的PATH中找不到。
    只要export PATH=$PATH:/usr/local/erlang/bin 就可以了。
    也可以使用软链接：
    ln -s /opt/erlang18/bin

    ln -s /opt/rabbitmq_server-3.5.4/sbin/rabbitmqctl /usr/local/bin/rabbitmqctl
    ln -s /opt/rabbitmq_server-3.5.4/sbin/rabbitmq-defaults /usr/local/bin/rabbitmq-defaults
    ln -s /opt/rabbitmq_server-3.5.4/sbin/rabbitmq-env /usr/local/bin/rabbitmq-env
    ln -s /opt/rabbitmq_server-3.5.4/sbin/rabbitmq-plugins /usr/local/bin/rabbitmq-plugins
    ln -s /opt/rabbitmq_server-3.5.4/sbin/rabbitmq-server /usr/local/bin/rabbitmq-server
```
5. 配置：一般无需配置
    如需配置请参考：https://www.rabbitmq.com/configure.html

6. https://localhost:15672 队列管理后台
```
    rabbitmqctl  add_user  Username  Password
    rabbitmqctl  delete_user  Username
    rabbitmqctl  change_password  Username  Newpassword
    rabbitmqctl  list_users
   角色分为：
    超级管理员(administrator)  监控者(monitoring)   策略制定者(policymaker) 普通管理者(management)  其他
    rabbitmqctl  set_user_tags  User  Tag(Tag为角色administrator，monitoring，policymaker，management，或其他自定义名称)
    可以同时设置多个角色
   用户权限:
    用户权限指的是用户对exchange，queue的操作权限，包括配置权限，读写权限。
    配置权限会影响到exchange，queue的声明和删除。读写权限影响到从queue里取消息，
    向exchange发送消息以及queue和exchange的绑定(bind)操作。
    rabbitmqctl  set_permissions  -p  VHostPath  User  ConfP  WriteP  ReadP
    rabbitmqctl  list_permissions  [-p  VHostPath]
    rabbitmqctl  clear_permissions  [-p VHostPath]  User
```

7. [php amqp扩展的安装使用](https://github.com/153734009/doc/blob/master/php/extensions/amqp.php)


###依赖:
```
    gcc 
    glibc-devel 
    make 
    ncurses-devel 
    openssl-devel 
    autoconf 
    unixODBC-devel 
1. 安装依赖 unixODBC  
    yum install unixODBC-devel
```
