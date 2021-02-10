#!/bin/bash
#SBATCH --partition=debug
#SBATCH --account=PZSXXXX
   #Give the job a name 
#SBATCH --job-name=test_job
#SBATCH --time=00:03:00
#SBATCH --nodes=1 --ntasks-per-node=2

echo 'This script is running on:'
hostname
echo 'The date is :'
date
sleep 120