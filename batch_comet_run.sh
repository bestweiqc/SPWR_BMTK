#!/bin/bash

#SBATCH --partition compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH -A TG-DBS180005
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-01:30
#SBATCH --qos=normal

rm -rf output

module load gnu
module load gnubase

echo "Running model at $(date)"

mpirun nrniv -mpi -quiet -python run_bionet.py simulation_config.json

module unload gnu
module unload gnubase

echo "Done running model at $(date)"
