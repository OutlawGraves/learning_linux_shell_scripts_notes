

BEGIN {
	printf "please input series of numbers: "
}

/exit/ { is_exit=1 
	exit}
{
	for(i=1;i<=NF;i++){
		if($i !~ /^([0-9]|[1-9][0-9]+)$/){
			is_not_number=1
			break
		}else{
			array[i]=$i
		}
	}
	if(is_not_number==1)
		printf "please input series of numbers: "
	else{
		bubble_sort(array,NF)
		exit
	}
	
}


END {
	if(is_exit==1)
		print "exit"
	else
		print joinarray(array,NF)
}



