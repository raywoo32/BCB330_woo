COUNT=1
for VAR in 1posFlank.gff3 2posFlank.gff3 3posFlank.gff3 4posFlank.gff3 5posFlank.gff3 6posFlank.gff3 7posFlank.gff3 8posFlank.gff3 9posFlank.gff3 10posFlank.gff3 11posFlank.gff3 12posFlank.gff3 13posFlank.gff3 14posFlank.gff3
do
awk '{print $1 "\t" $2 "\t" $9 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9}' $VAR > "${COUNT}posNamedFlank.gff3"
COUNT=`expr $COUNT + 1`
done

COUNT=1
for VAR in 1negFlank.gff3 2negFlank.gff3 3negFlank.gff3 4negFlank.gff3 5negFlank.gff3 6negFlank.gff3 7negFlank.gff3 8negFlank.gff3 9negFlank.gff3 10negFlank.gff3 11negFlank.gff3 12negFlank.gff3 13negFlank.gff3 14negFlank.gff3
do
awk '{print $1 "\t" $2 "\t" $9 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9}' $VAR > "${COUNT}negNamedFlank.gff3"
COUNT=`expr $COUNT + 1`
done


