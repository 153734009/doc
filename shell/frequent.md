## 一些好用的shell

1. 根据端口获取pid
```
netstat -anp|grep 9501|awk '{printf $7}'|cut -d/ -f1
解释：
tcp 0   0   0.0.0.0:9501    0.0.0.0:*   LISTEN  3709/php
第7个 "3709/php" cut掉 /php
```
