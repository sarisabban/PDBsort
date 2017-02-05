# PDBsort
This script organises and moves PDB files after running the Rosetta Epigraft protocol as an array in a High Preformance Computer.
 

## DESCRIPTION:
This script will make it easy to search for only files with the correct size (150 amino acids or less) rather than look through all mixed (large and small) returned structures as a result of the Rosetta Epigraft Protocol. These structures (150 amino acids or less) can then be used for the Rosetta FFL (Fold From Loop) protocol and the Rosetta Abinition protocol. Contact author at sari.sabban@gmail.com for any questions regarding this script.



## HOW TO USE:

1. After running the Rosetta Epigraft protocol using an array execute this script in the same location where the files are located. If the files are in separate sub-folders run the script the top level folder.
2. The script will re-organise the structure as follows:
   + **scaffolds_bad_size** -> This directory will contain all the proteins that are +150 amino acids in size. 
   + **scaffolds_good_size** -> This directory will contain all the proteins that are 150 amino acids in size or less.
   + **chosen** -> this directory will be empty, ready for the user to copy to it all the structures he/she deems good enough to work on.
   + The Epigraft protocol's **score** files from different folders will be combined into one score file and will be placed in the top level folder.



## REFERENCES:

1. Refere to the paper by (Azoitei et.al., 2011 - [PMID: 22021856](https://www.ncbi.nlm.nih.gov/pubmed/22021856)) for details about the Rosetta Epigraft protocol.
2. Refere to the paper by (Correia et.al., 2014 - [PMID: 24499818](https://www.ncbi.nlm.nih.gov/pubmed/24499818)) for details about the Rosetta Fold From Loop (FFL) protocol.
