<?php
/**
 * pcntcl使用解析
 * 需要在命令行下执行
 *
 * 建议通看官网文档：
 * http://php.net/manual/zh/ref.posix.php
 * http://php.net/manual/zh/ref.pcntl.php
 */
$max = 10000;
$workers = 10;
 
$pids = array();
for($i = 0; $i < $workers; $i++){
    // fork是创建了一个子进程，父进程和子进程 都从fork的位置开始向下继续执行，
    // 不同的是父进程执行过程中，得到的fork返回值为子进程 号，而子进程得到的是0
    $pids[$i] = pcntl_fork();
    switch ($pids[$i]) {
        case -1:
            exit('fork失败');
        case 0:
            // 子进程执行。但pcntl没有提供进程间通信的功能，数据合并不方便
            // 更适合无需与主进程通信的逻辑
            echo $max / $workers * ($i+1);
            // 这个exit特别重要，它保证子进程执行完之后退出，而不是继续循环创建更多的子进程
            // 在循环中pcntl_fork 一般会导致进程数暴长，子又有孙 孙又有子 无穷匮也
            exit;
        default:
            break;
    }
}
// 保证主进程等候所有进程完结之后再结束了
foreach ($pids as $i => $pid) {
    if($pid) {
        pcntl_waitpid($pid, $status);
    }
}
// 有了上面的waitpid，可以保证下面代码在所有子进程完成后执行
echo ('继续执行主进程');

// 这个会得到6个'-'而不是2个；请理解这个
// 2 4 8 16 32
for ($i = 0;$i < 2;$i++) {
    $pid = pcntl_fork();
    print_r('-');
}
