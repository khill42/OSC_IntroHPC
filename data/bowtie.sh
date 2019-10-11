#PBS -N bowtie-dros
#PBS -l walltime=01:00:00
#PBS -l nodes=1:ppn=28
#PBS -A PZSXXXX
#PBS -j oe

set echo
module load bowtie2
cd $PBS_O_WORKDIR
cp Drosophila_melanogaster.BDGP6.22.dna.toplevel.fa $TMPDIR
cd $TMPDIR
bowtie2-build Drosophila_melanogaster.BDGP6.22.dna.toplevel.fa dros-index
cp *.* $PBS_O_WORKDIR