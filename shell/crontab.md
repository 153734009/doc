```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
0 1	* * *	 www /backup.sh
```
##crontab
核心文件位于 /etc/crontab
1. crontab -u <-l, -r, -e>
-u指定一个用户  
-l列出某个用户的任务计划  
-r删除某个用户的任务  
-e编辑某个用户的任务 编辑的是/var/spool/cron/目录下对应用户的文件  
/var/spool/cron/用户同名文件，不可以直接编辑的，只可以用crontab -e 来编辑。cron启动后每过一份钟读一次这个文件，检查是否要执行里面的命令。因此此文件修改后不需要重新启动cron服务。

2. 示例参考
```
第10、20、30分钟输出到/tmp/cron1.txt：
10,20,30 * * * * echo "第10、20、30分钟输出一次" >> /tmp/cron1.txt
以用户lzw.me的身份每两小时就运行某个程序：
0 */2 * * * lzw.me /usr/bin/somecommand >> /dev/null 2>&1
```

3. /etc/crontab 文件中run-parts部分  
/etc/crontab 文件中run-parts部分所示，它使用 run-parts 脚本来执行存在于 /etc/cron.hourly、/etc/cron.daily、/etc/cron.weekly 和 /etc/cron.monthly 目录中的脚本，这些脚本被相应地按照预设时间在每小时、每日、每周、或每月执行。这些目录中的文件应该是 shell 脚本，并且具有可执行权限(chmod +x filename)。

4. 重启cron的方法  
/etc/rc.d/init.d/crond restart
/etc/rc.d/init.d/crond {start|stop|status|reload|restart|condrestart}
