for i1 in {1..14}
do 
ARRAY=()
	for i2 in {1..14}
	do 
		if [ $i2 -ne $i1 ]
		then
			ARRAY+=("${i2}f.txt")
		fi
	done
	for item in "${ARRAY[@]}"
	do
		echo $item
		cat $item >> "${i1}elegansControlf.txt"
	done
done 

