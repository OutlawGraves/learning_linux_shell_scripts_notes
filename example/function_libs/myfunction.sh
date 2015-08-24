#!/bin/bash

myfunction(){
	echo "This is the myfunction function."
}

function anotherfunc(){
	echo "This is the 2nd"
}

#不支持这种写法
#function finalfunc{
#	echo "This is the 3rd"
#}

#Main code starts here

echo "Calling... function"
myfunction
anotherfunc
#finalfunc
echo "Done."
