<?php

/**
 * 利用php的新特性 yield，执行游标合并排序
 * php中yield特性主要用于操作游标和文件句柄，等可能占用大量内存的
 * 对于php的数组操作，没有优势
 *
 * AnoleYield排序只要求有一个相同的字段就可以了
 * AnoleYield甚至可以用于mysql游标和mongodb游标的排序，
 *
 * @author  陈景贵
 * @since   2016年01月07日
 * @doc     http://www.php.net/manual/zh/language.generators.overview.php
 */
class AnoleYield 
{
    /**
     * 生成器
     */
    private $generator;

    public function __construct($cursor, $cursor2, $sortKey, $sort=1)
    {
        if($sort===1){
            $this->generator = $this->yieldAsc($cursor, $cursor2);
        }else{
            $this->generator = $this->yieldDesc($cursor, $cursor2);
        }
    }

    /**
     * 升序排列
     * 注意：c1 c2必须是已经升序排序了的
     *
     * @param   $c1 objCursor  游标1
     * @param   $c2 objCursor  游标2
     * @author  153734009
     * @since   2016年01月07日
     */
    private function yieldAsc($c1, $c2)
    {
        //batchSize($size) 可以用时间换内存，通过batchSize设置从硬盘读取
        $c1->rewind();
        $c2->rewind();
        while($c1->current()!=null || $c2->current()!=null){
            if($c1->current()==null){
                $row = $c2->current();
                $c2->next();
                yield $row;
            }else if($c2->current()==null){
                $row = $c1->current();
                $c1->next();
                yield $row;
            }else if($c1->current()[$sortKey] <= $c2->current()[$sortKey]){
                $row = $c1->current();
                $c1->next();
                yield $row;
            }else if($c1->current()[$sortKey] > $c2->current()[$sortKey]){
                $row = $c2->current();
                $c2->next();
                yield $row;
            }
        }
    }

    /**
     * 升序排列
     * 注意：c1 c2必须是已经降序排序了的
     *
     * @param   $c1 objCursor  游标1
     * @param   $c2 objCursor  游标2
     * @author  153734009
     * @since   2016年01月07日
     */
    private function yieldDesc($c1, $c2)
    {
        $c1->rewind();
        $c2->rewind();
        while($c1->current()!=null || $c2->current()!=null){
            if($c1->current()==null){
                $row = $c2->current();
                $c2->next();
                yield $row;
            }else if($c2->current()==null){
                $row = $c1->current();
                $c1->next();
                yield $row;
            }else if($c1->current()[$sortKey] >= $c2->current()[$sortKey]){
                $row = $c1->current();
                $c1->next();
                yield $row;
            }else if($c1->current()[$sortKey] < $c2->current()[$sortKey]){
                $row = $c2->current();
                $c2->next();
                yield $row;
            }
        }
    }

    /**
     * 每页size条记录，获取第p页的数据
     *
     * @param   $p      int 第p页
     * @param   $size   int 每页的记录数
     * @author  153734009
     * @since   2016年01月07日
     */
    public function page($p, $size)
    {
        $skip = ($p-1)*$size;
        $limit = $size;
        $i=0;
        $rows = [];
        foreach($this->generator as $row){
            if($i<$skip){
                $i++;
            }else if($i<($skip+$limit)){
                $rows[] = $row;
                $i++;
            }else{
                break;
            }
        } 
        return $rows;
    }
}
