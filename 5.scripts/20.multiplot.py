import matplotlib.pyplot as plt
import scipy
import scipy.stats as stats
import json
import csv
#import seaborn as sns; sns.set()
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import missingno as msno
from matplotlib.pyplot import *
import warnings
import random
# Draw plot
import matplotlib.patches as patches
from matplotlib.ticker import MultipleLocator, ScalarFormatter 

#get_ipython().run_line_magic('matplotlib', 'inline')
# Prepare Data
df = pd.read_csv("./corporate_diversity.csv")
# Prepare Data
#df = df.groupby('Releases').size().reset_index(name='Companies')
# n = df['Releases'].unique().__len__()+1
# all_colors = list(plt.cm.colors.cnames.keys())
# random.seed(9)
# c = random.choices(all_colors, k=n)

# Plot Bars
fig, host = plt.subplots(figsize=(6,4), dpi=80) #, facecolor=(1, 1, 1) , facecolor="white"

par1 = host.twinx()
par2 = host.twinx()


def make_patch_spines_invisible(ax):
    ax.set_frame_on(True)
    ax.patch.set_visible(False)
    for sp in ax.spines.values():
        sp.set_visible(False)



# host.set_facecolor('xkcd:white')
# Offset the right spine of par2.  The ticks and label have already been
# placed on the right by twinx above.
par2.spines["right"].set_position(("axes", 1.2))
# Having been created by twinx, par2 has its frame off, so the line of its
# detached spine is invisible.  First, activate the frame but make the patch
# and spines invisible.
make_patch_spines_invisible(par2)
##Second, show the right spine.
par2.spines["right"].set_visible(True)

grid(color='r', linestyle='-', linewidth=.2)


host.set_xlim(0, 13)
host.set_ylim(0, 220)
par1.set_ylim(0, 5000)

host.set_xlabel("OpenStack Releases", fontsize=16)
host.set_ylabel("#Contributing Companies/release cycle", fontsize=16)
par1.set_ylabel("#Companies (NoC) with 50% of total commits", fontsize=16)

# # Add patches to color the X axis labels
f1 = patches.Rectangle((.50, -0.005), width=.40, height=.10, alpha=.2,
                       facecolor='green', transform=fig.transFigure)
f2 = patches.Rectangle((.120, -0.005), width=.370, height=.10, alpha=.2,
                       facecolor='yellow', transform=fig.transFigure)
fig.add_artist(f1)
fig.add_artist(f2)


p1, = host.plot(df['Releases'], df['Companies'], "darkblue", label="#Companies/Release")
p2, = par1.plot(df['Releases'], df['comcmts'], "k--", label="NoC with 50% commits")
host.yaxis.label.set_color(p1.get_color())
par1.yaxis.label.set_color(p2.get_color())


tkw = dict(size=5, width=2.5)
host.tick_params(axis='y', colors=p1.get_color(), **tkw)
par1.tick_params(axis='y', colors=p2.get_color(), **tkw)
host.tick_params(axis='x', **tkw, rotation=30)

lines = [p1, p2]
# plt.rcParams['axes.facecolor'] = 'white'

# sns.despine(left=True)
plt.yticks(visible=True)
plt.xticks(visible=True)

# plt.rcParams['axes.facecolor'] = 'w'
host.legend(lines, [l.get_label() for l in lines], fontsize=16)


# axhline(0,color='red') # x = 0
# axvline(0,color='red') # y = 0
host.grid(color='navy')
plt.rcParams['grid.linewidth'] = 2.
plt.rcParams.update({'axes.spines.left': True, 'axes.spines.right': True})



# Don't allow the axis to be on top of your data
host.set_axisbelow(True)

# Turn on the minor TICKS, which are required for the minor GRID
host.minorticks_on()


# Customize the major grid
host.grid(which='major', linestyle='-', linewidth='1.5', color='navy')
# Customize the minor grid
host.grid(which='minor', linestyle=':', linewidth='0.5', color='gray')


plt.show()
