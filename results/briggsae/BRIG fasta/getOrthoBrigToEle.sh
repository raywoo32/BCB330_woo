COUNT=1
for VAR in 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt 7.txt 8.txt 9.txt 10.txt 11.txt 12.txt 13.txt 14.txt
do
echo $COUNT
cat $VAR | grep -o "WBGene[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" > "${COUNT}brigFound.txt"
COUNT=`expr $COUNT + 1`
done
