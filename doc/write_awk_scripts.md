#编写awk脚本

###1.Hello World
演示"hello word"这个程序在awk中的编写和执行方式

```
	echo "this line of data is ignored" > test
	awk '{print "hello world"}' test
	awk '{print}' test2
```

awk程序都是输入驱动型的.除非有可以在其上操作的输入行,否则将什么也不做.当调用awk程序时,它将读入所提供的脚本,并检查其中指令的语法,然后awk将对每个输入行执行脚本中的命令.如果没有来自文件中的输入行,以上的print语句将不做任何事情.

```
	awk 'BEGIN {print "Hello,World"}'
```

awk中的BEGIN模式用于指定在第一个输入行读入之前要执行动作.如果程序只有一个BEGIN模式,并且没有其他的语句,awk将不处理任何输入文件.

###2.awk程序设计模型
awk程序由所谓的主输入循环组成.一个循环是一个例程,它将一直重复执行直到有一些存在的条件终止它.你不必写这个循环,它是现成的.作为一个框架存在,在这框架中你编写的代码能够执行.
主输入循环执行的次数和输入行相同.这种循环仅当有一个输入行时才执行.当没有其他输入行时循环将终止.

awk允许你编写两个特殊的例程,它们在任何输入读取前所有输入都被读取后执行.它们是BEGIN和END,这两个例程是可选的.

这样就可以将awk脚本看做3个主要部分组成:
+ 处理输入前将做的处理
+ 处理输入过程中将做的处理
+ 处理输入完成后做的处理

主输入循环被称为"处理过程中将做的处理"是主要的处理部分.在主输入循环中,指令被写成一系列的模式/动作过程.模式是用于测试输入行的规则,以确定动作是否将应用于输入行.

#####awk原理图
![awk](https://github.com/dongjiaqiang/learning_linux_shell_scripts_notes/blob/master/pictures/awk_liucheng.png)

###3.模式匹配
当awk读入一输入行时,它试图匹配脚本中的每个模式匹配规则.只有与一个特定的模式相匹配的输入行才能成为操作对象.如果没有指定操作,与模式相匹配的输入行将被打印出来.
```
	awk '/^$/ {print "This is a blank line."}' test
```

如果输入行为空,那将打印一行"This is a blank line".这里的模式匹配规则是一个正则表达式
	
```
#测试一下整数,字符串还是空行.
/[0-9]+/ { print "This is an Integer" }
/[a-z][A-Z]+/ { print "This is a String" }
/^$/ { print "This is a blank line."}
```

这里如果一个输入行能够和任何一个模式匹配,那么就执行相关的print语句.

###4.程序脚本的注释
在写脚本时添加注释是一个好习惯.注释以字符"#"开始,以换行符结束.

###5.记录和字段
awk假设它的输入是有结构,而不是一串无规则的字符.它将每个输入行作为一条记录,而将由空格或制表符分隔的单词作为字段(用来分隔字段的字符被成为分隔符).

__单个或连续多个空格以及制表符被作为一个分隔符__

###5.字段的引用和分离
awk允许使用字段操作符$来指定字段.在该操作符后面跟着一个数字或变量,用于标识字段的位置."$1"表示第一个字段,"$2"表示第二个字段,"$0"表示整个输入行.

可在命令行中使用-F选项来改变字段分隔符.

`awk -F"\t" '{print $2}' names` 

在脚本中指定字段分隔符是一个好习惯.可以通过定义系统变量FS来改变字段分隔符.

```
BEGIN { FS="," }
{print $1 "," $6}
```

```
/MA/ {print $1 "," $6 };$5 ~ /MA/ { print $1 "," $6 };$5 !~ /MA/ { print $1 "," $6 }
```
我看可以测试匹配指定的字段.使用(~)操作符可以测试一个字段的正则表达式,使用(!~)则实现反转这个规则的意义

#####1.字段的划分:完整的问题

`FS="\t+";FS="[,:\t]"`可以使用正则表达式指定字段分隔符,使用正则表达式指定字段分隔符时可以实现使用多个单个字符来定义字段分隔符

###6.表达式
可以使用表达式来存储,操作和检索数据,这些操作与在sed中具有非常大的区别

常量有两种类型:字符串或数字类型.字符串在表达式中必须使用引号括起来.

变量是引用值的标识符.定义变量只需要为它定义一个名字并将数据赋给它即可.

每个变量有一个字符串型值和数字型值,awk根据表达式的前后关系来选择合适的值(不含数字的字符串值为0).变量不必初始化.

`z="hello";z="hello" "world";w=$1,y=x+1`

第一个表达式是将字符串常量赋给变量,第二个表达式中空格可以作为字符串连接操作符,第三个表达式中$是引用字段操作符,一旦变量被赋予一个值,那就可以用这个变量名来引用这个值.

#####1.赋值操作符
1. ++
2. --
3. +=
4. -=
5. *=
6. /=
7. %=
8. ^=
9. **=

```
/^$/ {
	print x+=1
}

/^$/ {x++;print x }
```

虽然这里没有为变量x赋值,但是遇到第一个空行前它的值一直为0.

```
/^$/ { ++x }
END { print x }
```

这里使用END例程来最终输出结果

#####2.计算学生的平均成绩

```
BEGIN {
        num=5
        all_num=15
	OFS=","
	FS="[ *]"
}
{score=$2+$3+$4+$5+$6;all_score+=score;print NR"."$1,score/num }
END {
        print "all",all_score/all_num
}
```

###7.系统变量
awk中有许多系统变量或内置变量.awk有两种类型的系统变量,第一种类型定义的变量默认值可以改变,第二种类型定义的变量的值可用于报告和数据处理.

+ FS 定义输入数据的字段分隔符(默认值为单个或多个连续空格及制表符)
+ OFS 定义输出数据的字段分隔符(默认值为单个空格)
+ NF 定义当前输入记录的字段个数
+ RS 定义输入数据的记录分隔符(默认值为换行符)
+ ORS 定义输出数据的记录分隔符(默认值为换行符)
+ FILENAME 定义为包含当前输入数据的文件名字
+ NR 定义为当前输入记录的编号
+ FNR 定义与当前输入文件相关的当前输入记录的编号
+ CONVFMT  控制数字到字符串的转换(默认值为%.6g)

###8.处理多行记录
```
	BEGIN { FS="\n";RS=""}
	
```

#####支票簿的核算
```

BEGIN {
        FS="\t"
        OFS="\t"
}

NR == 1 { balance=$1
          next
        }
        { print $1,$2,$3
          print balance += $3
        }

END {
        print ""
        print "retail",balance
}

```

###9.关系操作符和布尔操作符
关系操作符和布尔操作符用于在两个表达式间进行比较

1. <
2. >
3. <=
4. >=
5. ==
6. !=
7. ~
8. !~

使用布尔操作符可以将一系列的比较组合起来.

1. ||
2. &&
3. !

`NF == 6 && NR > 1;NR > 1 && NF >=2 || $1 ~ /\t/;NR > 1 && ( NF >=2 || $1 ~ /\t/ );!( NR > 1 && NF > 3)`

###10.获取文件的信息

###11.格式化打印

###12.向脚本传递参数(这个参数可以在命令行上设置,放在脚本的后面,文件名的前面)
`awk 'script' var=value inputfile;awk -f scriptfile "high=$1" "low=$2" datafile;awk '{...}' dir=$(pwd) file1;awk '{...}' dir=$cwd file2`

也可以在命令行参数上设置系统变量

__命令行参数的一个重要限制是它们在BEGIN过程中不可用__

```
BEGIN { print n }
n==1 { print "first file" }
n==2 { print "second file" }

{
        if (n==1) print "first file"
        if (n==2) print "second file"
}
```
以这种方法对参数求值的问题是无法使用BEGIN过程测试或检验命令行提供的参数,只有当输入一行后它们才能够使用.

`awk 'script' -v var=value inputfile`在任何输入被读入前定义参数,用-v选项来指定

