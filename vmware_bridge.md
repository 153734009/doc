##vmware网络设置
@version    11.1.2
@os         window10
@author     153734009
@since      2015年12月30日  

----------
###使用bridge桥接方式，使虚拟机可以被其它机器访问###
本文承接上一篇Nat模式设置。<https://github.com/153734009/doc/blob/master/vmware_net.md>

再添加虚拟机物理网卡
-----
1. 在网卡添加界面，点击 添加-->选择网络适配器-->点选桥接模式-->完成
2. 设置MAC地址：00:00:00:00:00:02
3. /etc/udev/rules.d/70-persistent-net.rules文件中增加了以下内容  
```
# PCI device 0x8086:0x100f (e1000)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:00:00:00:00:02", ATTR{type}=="1", KERNEL=="eth*", NAME="eth1"
```

添加虚拟网络连接
-----
1. 点击菜单 "编辑"-->"虚拟网络编辑器"-->添加网络-->选择VMnet0
2. 选择刚添加的虚拟网络 VMnet0, 勾选桥接配置；不用再做ip配置
3. 添加后会在宿主机增加一个网络连接

配置ip
-----
1. 和宿主机是对等的，配置参考宿主机
```
DEVICE=eth1  
HWADDR=00:00:00:00:00:02  
TYPE=Ethernet  
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=no
NAME="System eth1"
IPADDR=172.18.107.194
NETMASK=255.255.255.0
GATEWAY=172.18.107.254 #设置和宿主机一样的网关
```

重启
-----
1. service network restart
