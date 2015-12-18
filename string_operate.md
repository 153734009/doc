##shell 字符串操作
@author     153734009
@since      2015年12月11日  

----------
**1. ${var-DEFAULT}**  
::如果var没有被声明, 那么就以$DEFAULT作为其值  
**2. ${var:-DEFAULT}**  
::如果var没有被声明, 或者其值为空, 那么就以$DEFAULT作为其值  
**3. ${var=DEFAULT}**  
::如果var没有被声明, 那么就以$DEFAULT作为其值  
**4. ${var:=DEFAULT}**  
::如果var没有被声明, 或者其值为空, 那么就以$DEFAULT作为其值  
**5. ${var+OTHER}**  
::如果var声明了, 那么其值就是$OTHER, 否则就为null字符串  
**6. ${var:+OTHER}**  
::如果var被设置了, 那么其值就是$OTHER, 否则就为null字符串  
**7. ${var?ERR_MSG}**  
::如果var没被声明, 那么就打印$ERR_MSG  
**8. ${var:?ERR_MSG}**  
::如果var没被设置, 那么就打印$ERR_MSG  
**9. ${!varprefix*}**  
::匹配之前所有以varprefix开头进行声明的变量  
**10. ${!varprefix@}**  
::匹配之前所有以varprefix开头进行声明的变量  
**11. ${#string}**  
::$string的长度  
**12. ${string:position}**  
::在$string中, 从位置$position开始提取子串  
**13. ${string:position:length}**  
::在$string中, 从位置$position开始提取长度为$length的子串  
**14. ${string#substring}**  
::从变量$string的开头, 删除最短匹配$substring的子串  
**15. ${string##substring}**  
::从变量$string的开头, 删除最长匹配$substring的子串  
**16. ${string%substring}**  
::从变量$string的结尾, 删除最短匹配$substring的子串  
**17. ${string%%substring}**  
::从变量$string的结尾, 删除最长匹配$substring的子串  
**18. ${string/substring/replacement}**  
::使用$replacement, 来代替第一个匹配的$substring  
**19. ${string//substring/replacement}**  
::使用$replacement, 代替所有匹配的$substring  
**20. ${string/#substring/replacement}**  
::如果$string的前缀匹配$substring, 那么就用$replacement来代替匹配到的$substring  
**21. ${string/%substring/replacement}**  
::如果$string的后缀匹配$substring, 那么就用$replacement来代替匹配到的$substring  
