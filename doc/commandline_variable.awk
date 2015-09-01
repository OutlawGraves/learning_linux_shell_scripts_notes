BEGIN { print n }
#n==1 { print "first file" }
#n==2 { print "second file" }

{ 
	if (n==1) print "first file"
  	if (n==2) print "second file"
}
 
