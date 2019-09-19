#!/bin/bash
#SBATCH --partition Lewis
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --qos=normal
#SBATCH --job-name=ca1
#SBATCH --output=ca1%j.out
#SBATCH --time 0-00:30


source activate bmtk_env

echo "Building model at $(date)"
python build_network.py

#python -m bmtk.utils.sim_setup -n network --membrane_report-vars v,cai --membrane_report-cells 10,11 --membrane_report-sections soma --tstop 1000.0 --dt 0.1 bionet
echo "Done building model at $(date)"

source deactivate 
