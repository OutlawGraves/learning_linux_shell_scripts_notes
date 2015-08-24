#!/bin/bash

#输入是一个待排序的数组变量
#输出是一个已排序的数组变量
bubble_sort(){
	$arr=$1
	$len=${#arr[@]}
	for i in seq 0 $((len-1))
	do
		for j in seq 0 $((len-2))
		do
			if [[ ${arr[$j]} -gt ${arr[$((j+1))]} ]];then
				tmp=${arr[$j]};arr[$j]=${arr[$((j+1))]};arr[$((j+1))]=tmp
			fi
		done

