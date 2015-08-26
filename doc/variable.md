#变量
变量对于编程语言是至关重要的,有了变量,我们可以基于变量的状态来修改脚本行为,也可以修改变量来反映外部环境的变化


###1.使用变量
`echo $PATH;PATH=/user/bin`

在Linux Shell中引用变量需要在其前添加美元符号,而在赋值时不需要

#####1.类型
在Linux Shell没有类型一说,所有变量的类型都是字符串,但是有些程序在处理字符串时会将其理解为数字，变量无需显示声明,没有赋值的变量等于包含空字符串

#####2.变量的赋值
+ 显式定义:VAR=value
+ 读取:read VAR
+ 命令替换:VAR=`date`,VAR=$(date)

`variable=foo;read variable;read firstname secondname`

在linux shell中可以用等号进行变量赋值,也可以通过read命令从终端读取输入

`read message</etc/motd;while read message;do statement(s) done </etc/motd`

read命令也可以实现从外部文件读取输入默认是读取一行,通过循环语句可以实现循环的读取

`TODAY=\`date +%A\`;TODAY=$(date +%A)`

变量赋值的另一种情况是将值设置为某个给定命令的输出

#####3.位置参数
`param.sh first second;if [ "$#" -ne "2" ];then statement(s);fi`

参数在脚本中通过命令行所处的位置进行引用:$0是命令本身,$1是第一个参数,$2是第二个参数,以此类推,这些变量值无法修改,其中$#存储着参数数量.

__shift命令实现参数的一次移位,首先截去$1，然后是$2,#$的值相应的减少,shift命令无法逆向进行,shift 3 则可以实现一次截去多个参数__

`for param in $*;for param in $@;for param in "$*";for param in "$@"`

$*和$@代表着所有的参数,其中未加双引号两者一样,如果参数间含空格,参数将被截断为两个参数,"$@"将不会对含空格的参数进行处理,而"$*"则将参数列表显示为一个参数

#####4.返回码
Shell将变量$?设置为上一次运行命令返回的代码

#####5.删除变量
`unset myvar`

使用unset命令可以实现变量的删除,将变量的值设为空字符串,将变量直接设为空字符串与使用unset是不一样的

###2.预定义变量和标准变量
+ HOME 是当前用户的主目录的路径
+ IFS 列出当成空格使用的字符集合,默认值为<space><tab><newline>
+ SECONDS 返回Shell运行的整秒数,它是脚本运行的时间,而不是调用它的shell的运行时间.如果将SECONDS修改为其他整数,它从那个整数开始计数.删除则会导致其成为普通变量
+ RANDOM 产生0~32767间的随机数.
+ TMOUT 用于内置命令read,select和交互式bash shell,如果该参数被删除或设为0则被忽略,如果为正,则使用它的前3个命令在$TMOUT秒后超时
+ PPID 是调用Shell或Shell脚本的进程ID,$$是Shell的进程ID


###3.变量的用法
`variable=value;echo ${variable}`
为变量赋值时,变量名前不使用美元符号,引用变量时需要美元符号

__在字符串上下文,未定义的变量被解释为空字符串,如果将变量当做数值,则解释为0__

__在变量命名上,通常对常数,文件名等内容的变量使用大写,而其他则小写__


#####1.变量的类型
变量的数学运算方式(如果其中的变量为非数值类型,在运算过程中将被设置为0)
+ $(($x+$y))
+ expr $x+$y
+ let $x+$y

#####2.变量的长度
`echo ${#variable}`

#####3.截取子串
`printf "${variable:1:2}"`
截取字符串从位置1开始的2个字符

#####4.从字符串开头和末尾剪裁
`${variable: -4};${variable:4}`
实现从variable末尾和开头截取字符串

#####5.使用模式剪裁字符串

+ ${variable#word} 从字符串开头使用非贪婪模式匹配
+ ${variable##word} 从字符串开头使用贪婪模式匹配
+ ${variable%word} 从字符串尾部使用非贪婪模式匹配
+ ${variable%%word} 从字符串尾部使用贪婪模式匹配

###4.字符串查找
#####1.字符串查找和替换
`var=${variable/Wintel/Linux};var=${variable//Wintel/Linux;var=${variable/#Wintel/Linux};var=${variable/%Wintel/Linux}`

实现对variable变量中将Wintel字符串替换为Linux，使用双斜线实现全部替换,而不是替换第一个匹配的,在匹配字符串前加#将只替换开头匹配,在其前加%实现只替换尾部匹配

#####2.模块替换
`echo ${user/f*d/wilma};echo ${user/f??d/wilm}`

查找模式可以包含通配符,但只能是贪婪匹配形式

#####3.模式删除
`echo ${user/fed};echo ${user/#fed};echo ${user//fed};echo ${user/%fed}`

删除模式中只需要不提供替换文本就可以实现查找删除

#####4.大小写转换
`echo ${variable^^};echo ${variable,,}`

前者实现变量转换为大写,后者实现变量转换为小写

#####5.提供默认值
+ {varname:-word} 如果varname存在且非null,则返回其值,否则返回word(如果变量未定义,则返回默认值)
+ {varname:=word} 如果varname存在且非null,则返回其值,否则返回word,但varname同时设置为word(如果变量为定义,则设置为默认值)
+ {varname:?word} 如果varname存在且非null,则返回其值,否则显示varname:message,同时退出脚本或命令(用于捕获变量未定义所导致的错误)
+ {varname:+word} 如果varname存在且非null,则返回word,否则返回null(测试变量是否存在)
+ 上述表达式去除:只测试varname存在

###5.间接操作

###6.使用source命令加载变量

