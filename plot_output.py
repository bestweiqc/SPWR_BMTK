from bmtk.analyzer import nodes_table
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pdb
from mpl_toolkits.mplot3d import Axes3D
import h5py
from bmtk.utils.cell_vars import CellVarsFile
from bmtk.analyzer.cell_vars import _get_cell_report
import matplotlib.pyplot as plt


# Load data
config_file = "simulation_config.json"
lfp_file = "./output/ecp.h5"

report_name = None
report_name, report_file = _get_cell_report(config_file, report_name)

f = h5py.File(lfp_file,'r')

# Extract data
var_report = CellVarsFile(report_file)
time_steps = var_report.time_trace

lfp = list(f['data'])
lfp_arr = np.asarray(lfp)

# Plot data
plt.figure()
plt.plot(time_steps, var_report.data(gid=10,var_name='v'))
plt.plot(time_steps, var_report.data(gid=11,var_name='v'))
#plt.savefig('mem_vol.png')


plt.figure()
plt.plot(lfp_arr[:,0])
plt.plot(lfp_arr[:,1])
plt.plot(lfp_arr[:,2])
#plt.savefig('lfp.png')

plt.figure()
from bmtk.analyzer.spike_trains import raster_plot, rates_plot

raster_plot('network/SPWR_biophysical_nodes.h5','network/SPWR_biophysical_node_types.csv','output/spikes.h5')

plt.show()

