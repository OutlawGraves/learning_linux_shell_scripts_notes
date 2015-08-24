#!/bin/bash

#输入是一个待排序的数组变量
#输出是一个已排序的数组变量
bubble_sort(){
	arr=$1
	len=${#arr[@]}
	j=1
	while [ $((len-j)) -ge 1 ]
	do
		for i in $(seq 0 $((len-j)))
		do
			if [ ${arr[$i]} -gt ${arr[$((i+1))]} ];then
				tmp=${arr[$i]};arr[$i]=${arr[$((i+1))]};arr[$((i+1))]=$tmp
			fi 
		done
		j=$((++j))
	done
        echo "${arr[@]}"
}

arr=(8 2 3 4 5 1 5 10)
bubble_sort "${arr[@]}"
