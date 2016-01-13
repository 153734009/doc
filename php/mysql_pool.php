<?php
$serv = new swoole_server("0.0.0.0", 9508);
$serv->set(['worker_num'=>1, 'task_worker_num'=>5]);
function onReceive($serv, $fd, $from_id, $data)
{
    $sql = $data;
    $result = $serv->taskwait($sql);
    if($result !== false){
        $serv->send($fd, $result . "\n");
    }else{
        $serv->send($fd, "Err:Task timeout\n");
    }
    //异步的时候就麻烦了，需要把$fd传递到onFinish，才能send数据到
    //$serv->task($sql);
}
/**
 * task保持数据库连接
 * 使用静态变量，因为变量没有释放，所以才能保持连接
 * mysql连接的数量= task_worker_num
 */
function onTask($serv, $fd, $from_id, $sql)
{
    static $conn = null;
    if($conn == null){
        $conn = mysqli_connect('127.0.0.1', 'root', '123456', 'help');
        if(!$conn){
            $conn = null;
            $serv->finish('ERR:'.mysqli_connect_error());
            return;
        }
    }
    $result = $conn->query($sql);
    if(!$result){
        $serv->finish('ERR:'.mysqli_error($conn));
        return;
    }
    $data = $result->fetch_all(MYSQLI_ASSOC);
    $serv->finish('OK:'.serialize($data));
}
function onFinish($serv, $task_id, $data)
{
    // 异步Task时有效
    echo "AsyncTask Finish:Connect.PID=".posix_getpid().PHP_EOL;
}
$serv->on('Receive', 'onReceive');
$serv->on('Task', 'onTask');
$serv->on('Finish', 'onFinish');
$serv->start();

//以下是客户端代码
//$client = new swoole_client(SWOOLE_SOCK_TCP, SWOOLE_SOCK_SYNC); //同步阻塞
//$client->connect('172.18.107.194', 9508, 0.5, 0);
//$client->send("show tables");
//$data = $client->recv();

/**
 * 查看mysql连接
 *
 * 1. mysql -uroot -p123456
 * 2. show status;
 *      其中的
 *      Threads_connected   | 1    
 *      就是mysql连接数
 */
