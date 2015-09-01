BEGIN {
        num=5
        all_num=15
	OFS=","
	FS="[ *]"
}
{score=$2+$3+$4+$5+$6;all_score+=score;print $1,score/num,FNR}
END {
        print "all",all_score/all_num,FNR
}
