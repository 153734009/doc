##sqlite3的安装
###简介  
目前，几乎所有版本的 Linux 操作系统都附带 SQLite。使用sqlite3命令检查是否安装了，如果已安装会进入sqlite命令行

1. 如果没有安装，需要下载:http://www.sqlite.org/download.html
```
Source Code
        sqlite-autoconf-3100100.tar.gz（下载源码自己编译）
Percompiled Binaries for Linx
        sqlite-shell-linux-x86-3100100.zip(预编译的二进制文件)
```

2. 建议直接使用二进制可执行文件，只需将文件放在可执行目录下就可以了如：/usr/local
```
unzip sqlite-shell-linux-x86-3100100.zip
cd sqlite-shell-linux-x86-3100100.zip
mv sqlite3 /usr/local/sqlite3
```

3. 如果要自己编译安装
```
tar xvfz sqlite-autoconf-3100100.tar.gz
cd sqlite-autoconf-3100100
./configure --prefix=/usr/local
make
make install
```

4. 执行sqlite3命令校验安装成功
```
/usr/local/sqlite3 (成功则进入sqlite命令界面)
```

5. php sqlite3扩展  
php5.3之后SQLite3 扩展默认是可用的，无需安装
```
示例：
$db = new SQLite3('name.db');
$db->exec('create table t(id int,name string)');
$db->exec("insert into t(id,name) values(1, 'name')");
$results = $db->query('SELECT * FROM t');
while ($row = $results->fetchArray()) {
    var_dump($row);
}
```
