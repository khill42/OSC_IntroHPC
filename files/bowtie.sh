#!/bin/bash
#SBATCH --partition=debug
#SBATCH --account=PZSXXXX
   #Give the job a name 
#SBATCH --job-name=bowtie-dros
#SBATCH --time=00:45:00
#SBATCH --nodes=1 --ntasks-per-node=20

set echo
module load bowtie2
cd $SLURM_SUBMIT_DIR
cp Drosophila_melanogaster.BDGP6.*toplevel.fa $TMPDIR
cd $TMPDIR
bowtie2-build Drosophila_melanogaster.BDGP6.*toplevel.fa dros-index
cp *.* $SLURM_SUBMIT_DIR