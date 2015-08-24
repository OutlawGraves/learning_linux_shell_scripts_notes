#数组
数组就是包含一系列值的集合变量,可以通过索引来进行访问

在Linux Shell中数组索引可以是

+ 文本
+ 数字

###1.数组赋值
数组赋值可以一次一个,一次多个,或按索引进行赋值，甚至可以实现从各种来源对数组进行赋值，包括通配符扩展和程序的输出
#####1.一次一个(每次对一个元素进行赋值)
```numberarray[0]=zero;numberarray[2]=two;numberarray[3]="one one one"```

在linux shell中可以实现定义稀疏的数组，数组值含有特殊字符时需要使用转义字符进行转义

#####2.一次全部(使用括号将一组值赋给数组变量)
```students=(Tom "J Klon" Mark);IFS=";";students=(Tom;"Lon Ka";Jklon)```

一系列值包裹在括号中整体赋给一个数组变量，一系列值的分隔符定义在IFS中，缺点是无法定义稀疏数组

*IFS:内部字段分隔符(Internal Field Separator)*

```for student in "${students[@]}"
   do
	echo $student
   done```

这是在shell中遍历数组值的方法

#####3.按索引访问
```students=([0]=Karl [1]="Jim" [2]="Leo Karl")```
主要适合于创建稀疏数组

#####4.从源中一次全部读取(这是一次全部的特殊情况,括号中可以是文件名扩展或是任何命令或函数的输出)
```hosts=( $(cat /etc/hosts | grep -v -e"^$" -e "^#") )```

#####5.从输入中读取(由read命令的-a标志实现)
```printf "1:2:3" | IFS=":" read -a dict```

#####6.使用readarray命令实现从文件中按换行符读取数据,其中-n标志实现读取的行数,-s实现可跳过的行数
```readarray -n 4 -s 2 hosts < /etc/hosts```
###2.数组访问
访问数组必须使用花括号,省略花括号将只访问数组的第一个元素

#####1.数组长度
`arraylen=${#myarray[@]};arraylen=${#myarray[*]}`


#####2.用变量索引访问
`beattles=(John Paul Ringo);for index in $(seq 0 $((${#beattles[@]} - 1))`

这是一个实现冒泡排序的shell脚本[bubble.sh](https://github.com/dongjiaqiang/learning_linux_shell_scripts_notes/blob/master/example/array/bubblesort.sh)

#####3.从数组中选择元素(可以实现从数组中检索出一定范围的元素)
`food={apple eggs grapes};echo "${food[@]:1:2}";echo "${food[@]:2}"`
实现访问数组中从索引位置开始的多个元素

#####4.显示整个数组
`printf "Distro: %s\n" "${distros[@]}"`

###3.关联数组(数组索引为文本形式)
`beattles=([single]=John [bassist]=Paul [drummer]=Ringo);for musician in singer bassist drummer do echo "The ${musician} is ${battles[$musician]}." done`

关联数组可以实现对索引名称的反向引用
`for instrument in "${!battles[@]}" do echo "The $instrument is ${battles[$instrument]}" done`

###4.数组操作
#####1.数组的复制(实现一个数组的复制非常简单,但对于稀疏数组其索引值将不按照这种方式传递)
`hobby=( "${students[@]}" )`

#####2.向数组追加元素
`students=( "${students[@]}" "lol game" );hobbies[${#hobbies[@}]="lol game"`

#####3.从数组中删除元素(unset myarray 可以实现完成删除数组)
`myarray[7]=;unset myarray[7]`

这两者是有区别的,前者只是将其设置为空字符串,而后者可以实现完成删除字符串

###5.高级技术

###6.本章小结
