BEGIN {
	printf "Enter glossy: "
}

FILENAME == "glossy" {
	glossy[$0]=$1
	next
}

$0 !~ /^$/ {
	if($0 in 
