COUNT=1
for VAR in 1posNamedFlank.gff3 2posNamedFlank.gff3 3posNamedFlank.gff3 4posNamedFlank.gff3 5posNamedFlank.gff3 6posNamedFlank.gff3 7posNamedFlank.gff3 8posNamedFlank.gff3 9posNamedFlank.gff3 10posNamedFlank.gff3 11posNamedFlank.gff3 12posNamedFlank.gff3 13posNamedFlank.gff3 14posNamedFlank.gff3
do
bedtools getfasta -fi brig.fa -name+ -bed $VAR -s > "${COUNT}pos.fa"
COUNT=`expr $COUNT + 1`
done

COUNT=1
for VAR in 1negNamedFlank.gff3 2negNamedFlank.gff3 3negNamedFlank.gff3 4negNamedFlank.gff3 5negNamedFlank.gff3 6negNamedFlank.gff3 7negNamedFlank.gff3 8negNamedFlank.gff3 9negNamedFlank.gff3 10negNamedFlank.gff3 11negNamedFlank.gff3 12negNamedFlank.gff3 13negNamedFlank.gff3 14negNamedFlank.gff3
do
bedtools getfasta -fi brig.fa -name+ -bed $VAR -s > "${COUNT}neg.fa"
COUNT=`expr $COUNT + 1`
done
