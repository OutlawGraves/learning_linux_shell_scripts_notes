#循环
shell中存在for,while,until和select这四种循环结构

###1.for循环
for循环遍历一个序列中的每一个元素直到终点

`for fruit in apple orange pear;do statement(s) done;statement(s)`

这是for循环最简单的形式

#####1.for循环的使用时机
#####2.向for提供数据
`fruits="apple orange pear";for fruit in fruits;do statement(s) done;statement(s)`

这里for循环输入不再是硬编码的值,而是可以提供一个变量,这里的字段间的分隔符由IFS定义

`echo -en "Please tell me some of fav fruit: ";read fruits;for fruit in $fruits;do statement(s) done;statement(s)

这里可以使用read从外部输入数据


