#函数

###1.算术函数

有9个内置函数可以被归类为算术函数.它们大多数接受数值型参数并返回数值型值

+ cos(x) 返回x的余弦
+ exp(x) 返回e的x次幂
+ int(x) 返回x的整数部分的值
+ log(x) 返回x的自然对数
+ sin(x) 返回x的正弦
+ sqrt(x) 返回x的平方根
+ atan2(y,x) 返回y/x的反正切
+ rand() 返回伪随机数r,0<=r<1
+ srand(x) 建立rand()的新的种子数

###2.字符串函数

+ gsub(r,s,t) 在字符串t中用字符串s替换正则表达式r匹配的所有字符串.返回替换的个数.如果t未给出,默认为$0.
+ index(s,t) index(s,t) 返回子串t在字符串s中的位置,如果没有指定s,则返回0
+ length(s) 返回字符串s的长度,当没有给出s时,返回$0的长度
+ match(s,r) 如果正则表达式r在s中出现,则返回出现的起始位置;如果在s中没有发现r,则返回0.设置RSTART和RLENGTH的值
+ split((s,a,sep) 使用字段分隔符sep将字符串s分解到数组a的元素中,返回元素的个数.如果没有给出sep,则使用FS.数组分隔和字段分隔采用同样的方式
+ printf("fmt",expr) 对expr使用printf格式说明
+ sub(r,s,t) 在字符串t中用s替换正则表达式r的首次匹配.如果成功则返回1,否则返回0.如果没有给出t,默认为$0


###3.自定义函数
使用用户自定义函数,awk允许程序员新手采用与c编程语言不同的步骤来编写程序,这就是使用自含式函数.

`function name (parameter-list){ statements }`

函数定义可以放置在脚本中模式操作规则可以出现的任何地方.通常情况下,我们将函数定义放在脚本顶部的模式操作规则前.

`return expression`函数中通常包含一个return语句,用于将控制返回到脚本中调用该函数的位置.

理解局部变量和全局变量的概念是很重要的.一个局部变量是函数的内部变量,不能在这个函数外面访问.全局变量正相反,可以在脚本的任何地方被访问和修改.

awk中在函数体中定义的变量默认为全局变量.而声明变量为函数的局部变量,需要在参数列表中定义这些变量.

```
function insert(a,b){
	c=1
}
```

其中a,b声明为局部变量,而c则是全局变量.在awk中函数都是传值调用,而数组则是按引用传递.

#####1.编写一个排序函数

#####2.维护函数库

`awk -f g.awk -f /usr/bin/sort.awk test 可以将函数编写入独立的awk文件,在引用所需的函数时,将该文件引入`
