#!/bin/bash

#SBATCH --partition Lewis
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --qos=normal
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-00:30

rm -rf output

source activate bmtk_env

module load openmpi/openmpi-2.0.0

module list

echo "Running model at $(date)"

mpiexec nrniv -mpi -quiet -python run_bionet.py simulation_config.json

echo "Done running model at $(date)"

module unload openmpi/openmpi-2.0.0

source deactivate
