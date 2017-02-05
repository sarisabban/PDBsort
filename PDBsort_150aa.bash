#!/bin/bash

# Author: Sari Sabban
# Email:  sari.sabban@gmail.com
# URL:    https://github.com/sarisabban
# Date:   13 January 2017
#
# Modified By:   	Sari Sabban
# Modified Time: 	13 January 2017

<<COMMENT
DESCRIPTION:
------------
This script organises and moves PDB files after running the Rosetta Epigraft protocol in an array in a High Preformance Computer. This script will make it easy to search for only files with the correct size (150 amino acids or less) rather than look through all structures, which are usually 150 amino acids or more, after which the strucutres will be used for the Rosetta FFL protocol. Contact author at sari.sabban@gmail.com for any questions regarding this script. Refere to the paper by (Azoitei et.al., 2011 - PMID: 22021856) for details about the Rosetta Epigraft protocol. Refere to the paper by (Correia et.al., 2014 - PMID: 24499818) for details about the Rosetta Fold From Loop (FFL) protocol.



HOW TO USE:
-----------
1. The output from Rosetta Epigraft will be many directories each including structures that the protocol has grafted, this directory organisation results from running the protocol as an array in a supercomputer.
2. Run the script in the working directory where all the scaffold directories are located.
3. The script will move all the PDB files from all the directories into one single directory, then measure the size of each structure and move the files with structures 150 amino acids or less to a new directory called scaffolds_good_size.
COMMENT

################################################################################################################33

mkdir scaffolds_bad_size
mkdir scaffolds_good_size
mkdir chosen
find . -name '*.pdb' -exec mv {} scaffolds_bad_size \;
find . -type f -name '*.sc' -exec cat {} + > scores.sc
grep SCORE scores.sc | sort -nk +2 | awk '{print $2 "\t" $4 "\t" $13 "\t" $23 "\t" $32}' > sorted_scores
sed -i "/description/d}" sorted_scores
rm -r res_*

for file in scaffolds/*.pdb; do
	CHAINAnumb=`grep ATOM $file | awk '{print $5 "\t" $6}' | grep A | tail -n 1 | awk '{print $2}'`
	CHAINBnumb=`grep ATOM $file | awk '{print $5 "\t" $6}' | grep B | tail -n 1 | awk '{print $2}'`

	[[ $CHAINBnumb = *[!0-9]* || $CHAINAnumb = *[!0-9]* ]] && continue 

	AminoAcids=$((CHAINBnumb-CHAINAnumb))  #<-skip syntax error here
	echo $AminoAcids

	if (( $AminoAcids \< 150 ))
		then
			mv $file correct_size;
	fi
done
