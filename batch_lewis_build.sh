#!/bin/bash
#SBATCH --partition Lewis
#SBATCH -N 5
#SBATCH -n 100
#SBATCH --qos=normal
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-00:30

module load intel/intel-2016-update2
module load nrn/nrn-mpi-7.4
module load openmpi/openmpi-2.0.0

module list


echo "Building model at $(date)"
python build_network.py

python -m bmtk.utils.sim_setup -n network --membrane_report-vars v,cai --membrane_report-cells 10,11 --membrane_report-sections soma --tstop 1000.0 --dt 0.1 bionet
echo "Done building model at $(date)"

