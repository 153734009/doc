##erbar--erlang项目管理

1. 安装
```
    cd /alidata/erlang
    wget https://github.com/rebar/rebar/archive/2.6.1.zip
    unzip 2.6.1.zip
    cd rebar-2.6.1
    ./bootstrap
    #这样就编译成功了，在当前目录下生成一个可执行的rebar文件
    mv rebar ../
    cd ../
    验证安装成功： ./rebar -V
       rebar 2.6.1 18 20150929_075124 No VCS info available.
    
    强烈建议:将rebar放到 “已加入环境变量的” erlang bin目录
    这样可以 直接执行. 
    cp rebar /opt/erlang18/bin/
```
1.1 测试 rebar 下载依赖
```
    mkdir hello
    cd hello
    vim rebar.config
    {deps, [
        {cowboy, ".*", {git, "git://github.com/extend/cowboy.git", "master"}}
    ]}.
    在保存配置文件rebar.config的目录hello里输入命令:
    rebar get-deps
    hello 目录下多了个deps目录
```
2. cd /alidata/erlang
```
    mkdir hello
    cp rebar hello/
    cd hello
    ./rebar create-app appid=hello
```
3. 写一个hello world
```
   -module(hiErlang).
   -export([start/0]).
   start()->
       io:format("hello world ~n").
``
4. 整合外部程序（添加依赖）
```
    -module(hello).
    -export([start/0]).
    start()->
        Handle = bitcask:open("hello_db, [read_write]"),
        N = fetch(Handle),
        store(Handle, N+1),

        io:format("hello world: ~p times ~n", [N]),
        bitcask:close(Handle),
        init:stop().

    store(Handle, N)->
        bitcask:put(Handle, <<"executions">>, term_to_binary(N)).

    fetch(Handle)->
        case bitcask:get(Handle, <<"executions">>) of
            not_fount->1;
            {ok, Bin}->binary_to_term(Bin)
        end.
```
5. 上面用到的bitcash是外部程序，需要再配置文件中声明
```
    vim hello.config
    内容如下：
    {deps, [{bitcask, ".*", {git, "git://github.com/basho/bitcask.git", "master"}}]}.
```
6. 添加编译文件Makefile
```
    vim Makefile
    all:
        test -d deps || rebar get-deps
        rebar compile
        @erl -noshell -pa './deps/bitcask/ebin' -pa './ebin' -s hello start
```
