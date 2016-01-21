##linux mysql重置root密码  
=================================
1. 修改配置文件，忽略密码启动  
        vi /etc/my.cnf
        在[mysqld]的段中加上一句：skip-grant-tables 
例如：
        [mysqld] 
        socket=/tmp/mysql.sock 
        skip-grant-tables 
:wq 退出vi  

2. 重启mysqld  
        /etc/init.d/mysqld restart

3. 修改root密码  
        cd /alidata/service/mysql-5.6.15/bin/mysql
        # mysql
        mysql> use mysql;
        mysql> UPDATE user SET Password = password ( 'new-password' ) WHERE User = 'root' ; 
记得刷新权限表，重要  
        mysql> flush privileges ; 
        mysql> quit 

4. 再把配置文件改回去  
        # vi /etc/my.cnf 

5. 最后重新启动mysqld  
        /etc/init.d/mysqld  restart
