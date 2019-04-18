for i1 in {1..14}
do
ARRAY=()
	for i2 in {1..14}
	do
		if [ $i1 -ne $i2 ]
		then
		ARRAY+=("${i2}.fa")
		fi
	done
	for i in "${ARRAY[@]}"
	do
	cat $i >> "${i1}control.fa"
	done
done

