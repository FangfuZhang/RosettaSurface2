#!/bin/bash
EXE="/nfs/04/uak0258/HA_bind_pep/oldRS/001/HA6_1/score/a.out"

for ((i=1; i<=10; ++i))
	do
	for ((j=1; j<=2000; ++j))
		do
        	echo $i $j
        	cd $HOME/HA_bind_pep/oldRS/001/HA6_1/score/
		if [[ "j" -lt "10" ]]
        	then
        	RMSD=$($EXE aatest_1494.pdb ../job$i/output_files/aatest_000$j.pdb)
                awk '{if (NR == 4460) printf "%5d%8.3f%12.4f%10d\n", "'$i'", "'"$RMSD"'", $2, "'$j'"}' < ../job$i/output_files/aatest_000$j.pdb >> out
		elif [[ "$j" -lt "100" ]]
        	then
        	RMSD=$($EXE aatest_1494.pdb ../job$i/output_files/aatest_00$j.pdb)
                awk '{if (NR == 4460) printf "%5d%8.3f%12.4f%10d\n", "'$i'", "'"$RMSD"'", $2, "'$j'"}' < ../job$i/output_files/aatest_00$j.pdb >> out
		elif [[ "$j" -lt "1000" ]]
        	then
        	RMSD=$($EXE aatest_1494.pdb ../job$i/output_files/aatest_0$j.pdb)
                awk '{if (NR == 4460) printf "%5d%8.3f%12.4f%10d\n", "'$i'", "'"$RMSD"'", $2, "'$j'"}' < ../job$i/output_files/aatest_0$j.pdb >> out
		else
        	RMSD=$($EXE aatest_1494.pdb ../job$i/output_files/aatest_$j.pdb)
                awk '{if (NR == 4460) printf "%5d%8.3f%12.4f%10d\n", "'$i'", "'"$RMSD"'", $2, "'$j'"}' < ../job$i/output_files/aatest_$j.pdb >> out
		fi
		done
done
