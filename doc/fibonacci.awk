BEGIN {
	times=5
	printf "Enter number: "
}

/^([0-9]|[1-9][0-9]+)$/ {
		if($1==0)
			print 0
		else if($1==1)
			print 1
		else{
			fact=$1
			for(x=$1-1;x>1;x--)
				fact*=x
			print fact
		}
		
		exit	
	}

{ 
	if(times==0){
		fav[0]=2
		print "interrput"
		exit 1
	}
	printf "Enter number: " 
	times--;	
}

END { print fav[0] }


