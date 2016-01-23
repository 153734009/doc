##直接使用Binary文件 [rabbitMQ3.5.4](http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.4/rabbitmq-server-generic-unix-3.5.4.tar.gz)
1. cd /root/download
```
    wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.4/rabbitmq-server-generic-unix-3.5.4.tar.gz
```
2. tar -xvf rabbitmq-server-generic-unix-3.5.4.tar.gz

3. mv rabbitmq_server-3.5.4 /usr/local/rabbitmq_server-3.5.4

4. app形式运行:
```
    rabbitmq-server -detached
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
    默认的 guest 用户无法登陆，需要新建用户并设置为管理员才能登陆
    rabbitmqctl add_user root 123456
    rabbitmqctl set_user_tags administrator
```

7. 停止服务
```
rabbitmqctl stop_app 
运行rabbitmqctl 了解更多命令
```

8. [php amqp扩展的安装使用](https://github.com/153734009/doc/blob/master/php/extensions/amqp.php)

### shell命令说明
1. rabbitmqctl start_app    启动服务，后台运行
2. rabbitmqctl stop [pid]  
   rabbitmqctl stop_app     停止服务
3. rabbitmqctl delete_user  Username 删除用户
4. rabbitmqctl change_password  Username  Newpassword 修改密码
5. rabbitmqctl list_users 列出所有用户
6. rabbitmqctl set_user_tags administrator monitoring policymaker management 其他自定义  
   超级管理员(administrator)  监控者(monitoring)   策略制定者(policymaker) 普通管理者(management)  其他
7. rabbitmqctl reset 重置（会删除设置的账号等，慎用！！需要先stop_app）
8. rabbitmqctl  set_permissions  -p  VHostPath  User  ConfP  WriteP  ReadP  
   用户权限指的是用户对exchange，queue的操作权限，包括配置权限，读写权限。  
   配置权限会影响到exchange，queue的声明和删除。读写权限影响到从queue里取消息  
   向exchange发送消息以及queue和exchange的绑定(bind)操作。
9. rabbitmqctl  clear_permissions  [-p VHostPath]  User 删除用户权限
10. rabbitmqctl  list_permissions  [-p  VHostPath]

### 交换机类型介绍
#### 1.Direct Exchange 
Direct Exchange – 处理路由键。需要将一个队列绑定到交换机上，要求该消息与一个特定的路由键完全匹配。这是一个完整的匹配。如果一个队列绑定到该交换机上要求路由键 “dog”，则只有被标记为“dog”的消息才被转发，不会转发dog.puppy，也不会转发dog.guard，只会转发dog。  
![Direct](https://raw.githubusercontent.com/153734009/doc/master/_img/direct_exchange.png "Direct")

#### 2.Fanout Exchange
Fanout Exchange – 不处理路由键。你只需要简单的将队列绑定到交换机上。一个发送到交换机的消息都会被转发到与该交换机绑定的所有队列上。很像子网广播，每台子网内的主机都获得了一份复制的消息。Fanout交换机转发消息是最快的.  
![Fanout](https://raw.githubusercontent.com/153734009/doc/master/_img/fanout_exchange.png "Fanout")

#### 3.Topic Exchange
Topic Exchange – 将路由键和某模式进行匹配。此时队列需要绑定要一个模式上。符号“#”匹配一个或多个词，符号“*”匹配不多不少一个词。因此“audit.#”能够匹配到“audit.irs.corporate”，但是“audit.*” 只会匹配到“audit.irs”。topic交换机工作原理如下：  
![Topic](https://raw.githubusercontent.com/153734009/doc/master/_img/topic_exchange.png "Topic")
#### 4.Headers exchange 
Headers exchange - 头交换机用于路由根据消息头更容易分类消息的情况，比如：路由键不是字符串，而是整数 hash等等。头路由可以看做特殊的direct；使用了Headers exchange模式的话，会忽略路由键

#### 5.Default Exchange
当你手动创建一个队列时，后台会自动将这个队列绑定到一个名称为空的Direct类型交换机上，绑定路由名称与队列名称相同。有了这个默认的交换机和绑定，我们就可以像其他轻量级的队列，如Redis那样，直接操作队列来处理消息。不过只是看起来是，实际上在RabbitMQ里直接操作是不可能的。消息始终都是先发送到交换机，由交换级经过路由传送给队列，消费者再从队列中获取消息的。不过由于这个默认交换机和路由的关系，使我们只关心队列这一层即可，这个比较适合做一些简单的应用
