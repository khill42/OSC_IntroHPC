#!/bin/bash
#PBS -q debug
#PBS -A PZSXXXX
  #Give the job a name 
#PBS -N test_script
#PBS -l walltime=00:03:00
#PBS -l nodes=1:ppn=2

echo 'This script is running on:'
hostname
echo 'The date is :'
date
sleep 120