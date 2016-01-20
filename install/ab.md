##ubuntu 12.04 64位	201503191636
1. ab --help
```
    提示: The program 'ab' is currently not installed.
    You can install it by typing: apt-get install apache2-utils
```
2. apt-get install apache2-utils
```
    提示：Failed to fetch http://cn.archive.ubuntu.com/ubuntu/pool/main/a/apache2/apache2-utils_2.2.22-1ubuntu1.7_amd64.deb  
        Could not resolve 'cn.archive.ubuntu.com'
        E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
```
3. apt-get update

4. apt-get install apache2-utils
    安装成功

5. ab --help

6. 测试用例
```
    100并发执行1000个请求，并发越大占用的资源会越多
    ab -c 100 -n 1000 http://www.baidu.com/ >>/alidata/log/ab/1.txt
    ab -c 200 -n 1000 http://www.eweiwei.com/Login/index
    如需登录
    ab -n 100 -C Key1=Value1 (单cookie)
    ab -n 100 -H "Cookie: Key1=Value1; Key2=Value2" (多cookie)
```	

##centos6.5 201503191523
apache bench
```
    yum install httpd-tools
    ab --help
    :) 直接可用了
```
##window7
```
	cd D:
    d:
	cd wamp\bin\apache\apache2.4.9\bin\
```
###参数说明
```
	//总的请求数   
	-n requests Number of requests to perform宅   
	//一次同时并发的请求数 总的请求数(n)=次数*一次并发数(c)   
	-c concurrency Number of multiple requests to make    
	-t timelimit Seconds to max. wait for responses  
	-b windowsize Size of TCP send/receive buffer, in bytes  
	-p postfile File containing data to POST. Remember also to set -T  
	-u putfile File containing data to PUT. Remember also to set -T  
	-T content-type Content-type header for POSTing, eg.  
	'application/x-www-form-urlencoded'  
	Default is 'text/plain'  
	-v verbosity How much troubleshooting info to print  
	-w Print out results in HTML tables  
	-i Use HEAD instead of GET  
	-x attributes String to insert as table attributes  
	-y attributes String to insert as tr attributes  
	-z attributes String to insert as td or th attributes  
	-C attribute Add cookie, eg. 'Apache=1234. (repeatable)  
	-H attribute Add Arbitrary header line, eg. 'Accept-Encoding: gzip'  
	Inserted after all normal header lines. (repeatable)  
	-A attribute Add Basic WWW Authentication, the attributes  
	are a colon separated username and password.  
	-P attribute Add Basic Proxy Authentication, the attributes  
	are a colon separated username and password.  
	-X proxy:port Proxyserver and port number to use  
	-V Print version number and exit  
	-k Use HTTP KeepAlive feature  
	-d Do not show percentiles served table.  
	-S Do not show confidence estimators and warnings.  
	-g filename Output collected data to gnuplot format file.  
	-e filename Output CSV file with percentages served  
	-r Don't exit on socket receive errors.  
	-h Display usage information (this message)  
	-Z ciphersuite Specify SSL/TLS cipher suite (See openssl ciphers)  
	-f protocol Specify SSL/TLS protocol (SSL2, SSL3, TLS1, or ALL) 
```
