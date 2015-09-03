
function fibonaci(n){
	if(n==0)
		return 0
	else if(n==1)
		return 1
	else 
		return fibonaci(n-1)+fibonaci(n-2)
}
BEGIN {
	printf "Enter number: "
}

/^([0-9]|[1-9][0-9]+)$/{printf fibonaci($0) 
			next
}

/exit/ { exit 1 }

{ printf "Enter number: "}

END {
	print "exit";
}

