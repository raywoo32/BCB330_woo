for i in {1..14}
do 
file1="${i}pos.fa"
file2="${i}neg.fa"
echo $i
cat $file1 $file2 > "${i}.fa" 
done
