

students=( Moskow "Log Angles" "New York" )

for index in $(seq 0 $((${#students[@]} - 1 )))
do
	echo "Index $index is ${students[$index]}"
done

students[5]="Seoul"

for index in $(seq 0 $((${#students[@]} - 1 )))
do
	echo "Index $index is ${students[$index]}"
done

echo "Index 5 is ${students[5]}"
