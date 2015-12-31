##vmware网络设置
@version    11.1.2
@os         window10
@author     153734009
@since      2015年12月30日  

----------
###宿主机（这里是window10）没有网卡也可以连接虚拟机###
1. 删光虚拟机的网卡
        ```
        点击菜单 "虚拟机"==>"设置"
        从弹出的界面选择 "硬件" 选择卡（其实已经默认选这个选项卡了）
        如果有 "网络适配器"（就是网卡）,选择然后点击下面的移除,然后点确定。
        删除/etc/udev/rules.d/70-persistent-net.rules 文件
        ```

2. 为虚拟机添加网卡（类似于宿主机的物理网卡）
        ```
        同上，此次点击添加-->选择网络适配器-->点选NA模式-->完成
        （这步可选）点击高级修改MAC地址为 00:00:00:00:00:01 
        点击底下的 "确定" 这时真正创建虚拟机的网卡
        会自动生成/etc/udev/rules.d/70-persistent-net.rules文件
        ```
文件内容如下：
        ```
        SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:00:00:00:00:01", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
        ```

3. 删光虚拟网络
        ```
        点击菜单 "编辑"-->"虚拟网络编辑器"
        从弹出的界面点击 (需要具备管理员特权才能修改网络配置)"更改设置" 按钮，解锁操作锁定，这样才能操作
        依次选择VMnet* -->移除网络
        ```

4. 添加VMnet8（不知道为什么一定要VMnet8）
        ```
        同上，此次点击 "添加网络" 按钮，选择VMnet8确定添加. 
        然后选中VMnet8，选NAT模式；勾上连接到此网络，勾选DHCP服务
        （这步可选）在左下角修改子网ip,这里设为：192.168.3.0
        NAT设置里默认网关：192.168.3.2 不用改
        点击 "应用" 按钮
        这样会在宿主机 \控制面板\网络和 Internet\网络连接 下增加网络连接
        ```

5. 对ifcfg-eth0做ip设置
        ```
        /etc/sysconfig/network-scripts/
        如果已开启DHCP服务，可能不用进行这步设置
配置如下:
        DEVICE=eth0
        HWADDR=00:00:00:00:00:01 #这里设置第2不得MAC地址
        TYPE=Ethernet
        ONBOOT=yes
        NM_CONTROLLED=yes
        BOOTPROTO=static
        DEFROUTE=yes
        PEERDNS=yes
        PEERROUTES=yes
        IPV4_FAILURE_FATAL=yes
        IPV6INIT=no
        NAME="System eth0" #这里根据/etc/udev/rules.d/70-persistent-net.rules设置， 会要求name对应的mac地址和上面的HWADDR 硬件地址一致
        IPADDR=192.168.3.200 #这里设置任意ip,不过要在dhcp现在的ip范围内，如果你没改，很可能是 192.168.3.128-254
        NETMASK=255.255.255.0
        GATEWAY=192.168.3.2 #这里设置NAT设置里的网关，如果你没设，很可能是192.168.3.2
        DNS1=192.168.3.2
        ```

6. 如果宿主机可以联网
        ```
        ping www.qq.com
        那么：虚拟机也已经可以上网，即使宿主机器是无线网卡，wifi上网
        ```

7. 记住这两个有用的地址
        ```
        /etc/udev/rules.d/70-persistent-net.rules
        /etc/sysconfig/network-scripts/ifcfg-eth8
        ```

