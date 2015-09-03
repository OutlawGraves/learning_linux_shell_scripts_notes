function fibonaci(n){
	if(n==0)
		return 0
	else if(n==1)
		return 1
	else 
		return fibonaci(n-1)+fibonaci(n-2)
}
function joinarray(array,num){
	for(i=1;i<=num;i++)
		joinstr=array[i]" "joinstr
	return joinstr
}

function bubble_sort(array,num){
	for(i=1;i<=num;i++)
		for(j=1;j<=num-i;j++)
			if(array[j]<array[j+1]){
				tmp=array[j+1]
				array[j+1]=array[j]
				array[j]=tmp
			}
}



