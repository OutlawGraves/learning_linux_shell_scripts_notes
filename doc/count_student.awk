$2 !~ /^$/ {
	student_score[NR]=$2
}

END {
	for(x=1;x<=NR;x++)
		total_score+=student_score[x]
	student_avg=total_score/NR
	for(x=1;x<=NR;x++)
		if(student_score[x]<student_avg)
			below_avg++
		else if(student_score[x]==student_avg)
			equal_avg++
		else	
			upper_avg++
	print "classmate avg score is: "student_avg
	print below_avg==0?"0":below_avg,"student is below avg"
	print equal_avg==0?"0":equal_avg,"student is equal avg"
	print upper_avg==0?"0":upper_avg,"student is upper avg"
}
