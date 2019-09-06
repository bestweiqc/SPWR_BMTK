from bmtk.analyzer import nodes_table
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pdb
from mpl_toolkits.mplot3d import Axes3D
import h5py
from bmtk.analyzer.cell_vars import _get_cell_report, plot_report
import matplotlib.pyplot as plt
from scipy.signal import welch

# Load data
config_file = "simulation_config.json"
lfp_file = "./output/ecp.h5"
mem_pot_file = './output/membrane_report.h5'
raster_file = './output/spikes.h5'

# load 
f = h5py.File(mem_pot_file,'r')
mem_potential = f['v']['data']


f = h5py.File(lfp_file,'r')
lfp = list(f['data'])
lfp_arr = np.asarray(lfp)

f = h5py.File(raster_file,'r')
gids = f['spikes']['gids']
timestamps = f['spikes']['timestamps']

# Plot data

plt.figure()
plt.plot(mem_potential[:,0])

plt.figure()
plt.plot(lfp_arr[:,0])
plt.plot(lfp_arr[:,1])
plt.plot(lfp_arr[:,2])

plt.figure()
plt.plot(timestamps,gids,'.')

plt.figure()
x = lfp_arr[:,0]
fs = 10000
f, Pxx_den = welch(x, fs, nperseg=2000)
plt.semilogy(f, Pxx_den)
plt.xlim(0,500)

plt.show()

