#编写sed脚本
为了使用sed，首先需要编写一个含有一系列编辑操作的脚本,然后在某个输入文件上运行它,使用sed可以将类似于vi编辑器中手动的操作过程提取出来,并转换为一个非手动的过程,即通过脚本的实现

了解sed工作的３个基本原理:
+ 脚本中的所有编辑命令都将依次应用于每个输入行
+ 命令应用于所有的行(全局的),除非行寻址限制了受编辑命令影响的行
+ 原始的输入文件未被改变,编辑命令修改了原始行的备份并且此备份将发送到标准输出


###1.在脚本中应用命令
__sed首先将整个编辑脚本应用于第一行,然后读取第二个输入行并对其应用整个脚本__

#####2.模式空间
sed维护一种模式空间,即一个工作区或临时缓冲区,当应用编辑命令时将在那里存储单个输入行

###2.寻址上的全局透视
`sed /sebastopol/s/CA/Califonia/g`

sed命令可以制定零个,一个或两个地址,每个地址都是一个描述模式(word),行号(1)或者行寻址符号的正则表达式(^$)

+ 如果没有指定地址,那么命令将应用于每一行　d
+ 如果只有一个地址,那么命令应用于与这个地址匹配的任意行 1d
+ 如果指定了由逗号分隔的两个地址,那么命令应用于匹配第一个地址的的第一行和其后所有行,直到匹配第二个地址的行(包括此行)  1,2d
+ 如果地址后面跟有感叹号(!),那么命令就应用于不匹配该地址的所有行  1,2!d

使用sed的删除命令d来进行演示

`sed 'd' input`

只使用d命令将删除所有的输入

`sed '1d' input;sed '$d' input;sed '/^$/d' input`

提供了一个地址将删除输入的第一行,在sed中无论输入有多少文件,都只存在一个第一行和最后一行

`sed '^\.TS/,/^\.TE/d' input;sed '1,/^$/d' input`

删除从第一个模式匹配的行开始,到由第二种模式匹配的行(包括此行在内)为止的所有行.地址可以混用行和正则表达式

`sed '1,2!d' input`

将使删除匹配范围之外的输入行

#####1.分组命令
sed使用大括号{}将一个地址嵌套在另一个地址中,或在相同的地址上应用多个命令,如果想指定行的范围,然后在这个范围内指定另一个地址,则可以嵌套地址.

```
/*\.TS/,/*\.TE/{
	/^$/d
}
```

左大括号必须在行末,而且右大括号必须独占一行,要确保大括号之后没有空格.

###3.测试并保存输出
`sed -f sedscr testfile > newfile`

sed命令不会对原始输入文件进行修改,如果需要保留输出,需要进行重定向

###4.sed脚本的4种类型
这里将看到4种类型的脚本,每类脚本都说明了一种典型的sed应用



