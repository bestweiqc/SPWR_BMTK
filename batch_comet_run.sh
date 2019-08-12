#!/bin/bash

#SBATCH --partition compute
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=20
#SBATCH -A TG-DBS180005
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-01:30
#SBATCH --qos=normal

rm -rf output

module load cuda

echo "Running model at $(date)"

mpirun nrniv -mpi -quiet -python run_bionet.py simulation_config.json

echo "Done running model at $(date)"
