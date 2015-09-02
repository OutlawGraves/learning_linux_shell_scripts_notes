#条件,循环和数组

###1.条件语句

条件语句用于在执行操作前做一个测试.模式匹配规则本质上就是影响主输入循环的条件表达式.但是,这部分主要探讨在action中使用的条件语句

条件语句以if开头,并在圆括号中放置表达式.

```if ( expression )
	action1
   [ else
	action2 ]
```

###2.条件操作符

`expr ? action1:action2;grade=(avg>=65)?"Pass":"Fail"`

###3.循环

while循环

```while(condition)
	action
	
```

do循环

```
do
	action
while(condition)

```

```
{
	total=i=0
	do
		{
			++i
			total+=$i
		}while(total<=100)
	print i,":",total
}
```

```
BEGIN {
        printf "Enter number: "
}

/^([0-9]|[1-9][0-9]+)$/ {
                if($1==0)
                        print 0
                else if($1==1)
                        print 1
                else{
                        fact=$1
                        for(x=$1-1;x>1;x--)
                                fact*=x
                        print fact
                }

                next
        }

{ print "Please enter number" }
```
###4.影响流控制的其他语句

break语句使得循环终止,continue语句使得循环跳过余下部分,exit语句使得主输入循环退出并将控制转移到END规则,exit语句可以使用一个表达式作为参数,该表达式将作为awk的退出状态返回.

`awk { exit 5 } END { exit }`

###5.数组

数组用于存储一组数据的变量.

`array[subscript]=value`

在awk中不必指明数组的大小,只需要为数组指定标识符,向数组元素赋值是非常容易的.

#####1.关联数组(在awk中,所有的数组都是关联数组)

```
for(variable in array)
	do something with array[variable]
```

array是一个数组名字,variable是一个变量,可以将它看做和普通for循环计数器一样的递增的临时变量.这个变量在每次循环时被赋予一个特殊的下标.

#####2.测试数组中的成员资格
关键词in也是一个操作符,用在条件表达式中来测试一个下标是否是数组的成员.表达式为`item in array`

```if ('BASIC' in item) print "BASIC is found"```

#####3.用split()创建数组

内置函数split()能够将任何字符串分解到数组的元素中.这个函数对于从字段中提取"子字段"都是很有用的.语法如下

`n=split(string,array,separator)`

string是要被分解到名字为array的元素中的输入字符串.数组的下标从1到n,n为数组中元素的个数.元素根据指定的separator分隔符来分解.如果没有指定分隔符,那将使用字段分隔符(FS).separator是一个完整的正则表达式.

#####4.删除数组元素

awk提供了一个语句用于从数组中删除一个元素.语法为

delete array[subscript]

该语句将删除array下标为subscript的元素.特别的,使用in测试subscript将返回假.这与为数组元素赋给一个空值是不同的.

#####5.首字母缩写词处理器

#####7.作为系统变量的数组
awk提供两个系统变量,它们都是数组
+ ARGV 这是一个命令行参数的数组,不包括脚本本身和任何调用awk指定的选项.这个数组中的元素的个数可以从ARGC中获取
+ ENVIRON 一个环境变量数组,数组中的每个元素是当前环境变量的值,而其下标是环境变量的名字




