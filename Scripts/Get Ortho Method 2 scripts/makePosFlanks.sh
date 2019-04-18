COUNT=1
for VAR in 1finalpos.gff3 2finalpos.gff3 3finalpos.gff3 4finalpos.gff3 5finalpos.gff3 6finalpos.gff3 7finalpos.gff3 8finalpos.gff3 9finalpos.gff3 10finalpos.gff3 11finalpos.gff3 12finalpos.gff3 13finalpos.gff3 14finalpos.gff3
do
bedtools flank -i $VAR -g brig.genome -l 200 -r 0 > "${COUNT}posFlank.gff3"
COUNT=`expr $COUNT + 1`
done

COUNT=1
for VAR in 1finalneg.gff3 2finalneg.gff3 3finalneg.gff3 4finalneg.gff3 5finalneg.gff3 6finalneg.gff3 7finalneg.gff3 8finalneg.gff3 9finalneg.gff3 10finalneg.gff3 11finalneg.gff3 12finalneg.gff3 13finalneg.gff3 14finalneg.gff3
do
bedtools flank -i $VAR -g brig.genome -l 0 -r 200 > "${COUNT}negFlank.gff3"
COUNT=`expr $COUNT + 1`
done
