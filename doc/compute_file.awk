$9 !~ /^$/ {
	num++
	sum+=$5
	print $9
}

END {
	print "total file num is: "num,"totoal file size is: "sum
}
