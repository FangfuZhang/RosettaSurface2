#!/bin/bash


for ((i=1; i<=20; ++i)) 
do
	for ((j=1; j<=2000; ++j))
	do
	echo $i $j
	cd $HOME/HA_bind_pep/oldRS/100/P1/score/
	if [[ "j" -lt "10" ]]
	then
		awk '{if (NR == 3291) printf "%5d%12.4f%10d", "'$i'", $2, "'$j'"}' < ../job$i/output_files/aap100_000$j.pdb >> out
		awk '{if (NR == 3309) printf "%12.4f\n",$2}' < ../job$i/output_files/aap100_000$j.pdb >> out	
	elif [[ "$j" -lt "100" ]]
	then
		awk '{if (NR == 3291) printf "%5d%12.4f%10d", "'$i'", $2, "'$j'"}' < ../job$i/output_files/aap100_00$j.pdb >> out
		awk '{if (NR == 3309) printf "%12.4f\n",$2}' < ../job$i/output_files/aap100_00$j.pdb >> out
	elif [[ "$j" -lt "1000" ]]
	then
		awk '{if (NR == 3291) printf "%5d%12.4f%10d", "'$i'", $2, "'$j'"}' < ../job$i/output_files/aap100_0$j.pdb >> out
		awk '{if (NR == 3309) printf "%12.4f\n",$2}' < ../job$i/output_files/aap100_0$j.pdb >> out
	else
		awk '{if (NR == 3291) printf "%5d%12.4f%10d", "'$i'", $2, "'$j'"}' < ../job$i/output_files/aap100_$j.pdb >> out
		awk '{if (NR == 3309) printf "%12.4f\n",$2}' < ../job$i/output_files/aap100_$j.pdb >> out
	fi
	done
done

