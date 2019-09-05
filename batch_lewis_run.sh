#!/bin/bash

#SBATCH --partition Lewis
#SBATCH -N 5
#SBATCH -n 100
#SBATCH --qos=normal
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-00:30

rm -rf output

module load cuda

echo "Running model at $(date)"

mpirun nrniv -mpi -quiet -python run_bionet.py simulation_config.json

echo "Done running model at $(date)"
