#!/bin.bash

myfunc(){
	thefile=$1
	echo Hello number $2 >> $thefile
}

file1=/tmp/file.1

file2=`mktemp`

for i in 1 2 3
do
	myfunc $file1 $i
	myfunc $file2 $(($i+1))
done

echo "FILE 1 says:"
cat $file1
echo "FILE 2 says:"
cat $file2
