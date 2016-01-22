## http状态码集
@since20160122

```
状态		状态码	状态值					状态描述
+-------------------------------------------------------------------------+
成功		200	OK						正常
成功		201	Created					已建立
成功		202	Accepted				已接受
成功		203	Non-Authoritative Information		无认证信息
成功		204	No Content				无内容
成功		205	Reset Content			重置内容
成功		206	Partial Content			部分内容
成功		207	Multi-Status			多状态响应
重定向		300	Multiple Choices		复合选择
重定向		301	Moved Permanently		永久转移
重定向		302	Found					找到
重定向		303	See Other				访问其他
重定向		304	Not Modified			没有更改
重定向		305	Use Proxy				使用代理
重定向		306	Unused					未使用
重定向		307	Temporary Redirect		暂时重定向
客户端错误	400	Bad Request				错误请求
客户端错误	401	Unauthorized			未认证
客户端错误	402	Payment Required		支付请求
客户端错误	403	Forbidden				禁止
客户端错误	404	Not Found				没有找到
客户端错误	405	Method Not Allowed		方法不容许
客户端错误	406	Not Acceptable			不可接受
客户端错误	407	Proxy Authentication Required		要求代理认证
客户端错误	408	Request Timeout			请求超时
客户端错误	409	Conflict				冲突
客户端错误	410	Gone					离开
客户端错误	411	Length Required			长度请求
客户端错误	412	Precondition Failed		预处理失败
客户端错误	413	Request Entity Too Large请求的实体过大
客户端错误	414	Request-URI Too Long	请求URI过长
客户端错误	415	Unsupported Media Type	不支持的媒体类型
客户端错误	416	Requested Range Not Satisfiable		请求范围未满足
客户端错误	417	Expectation Failed		期望失败
客户端错误	422	Unprocessable Entity	无法处理的请求实体
客户端错误	423	Locked					锁定
客户端错误	424	Failed Dependency		依赖导致的失败
服务器错误	500	Internal Server Error	内部错误
服务器错误	501	Not Implemented			未实现
服务器错误	502	Bad Gateway				错误网关
服务器错误	503	Service Unavailable		服务不可用
服务器错误	504	Gateway Timeout			网关超时
服务器错误	505	HTTP Version Not Supported	版本不支持
服务器错误	507	Insufficient Storage	系统空间不足
```

