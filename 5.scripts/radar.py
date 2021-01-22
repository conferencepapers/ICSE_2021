import numpy as np

import matplotlib.pyplot as plt
from matplotlib.patches import Circle, RegularPolygon
from matplotlib.path import Path
from matplotlib.projections.polar import PolarAxes
from matplotlib.projections import register_projection
from matplotlib.spines import Spine
from matplotlib.transforms import Affine2D


def radar_factory(num_vars, frame='circle'):
    """Create a radar chart with `num_vars` axes.

    This function creates a RadarAxes projection and registers it.

    Parameters
    ----------
    num_vars : int
        Number of variables for radar chart.
    frame : {'circle' | 'polygon'}
        Shape of frame surrounding axes.

    """
    # calculate evenly-spaced axis angles
    theta = np.linspace(0, 2*np.pi, num_vars, endpoint=False)

    class RadarAxes(PolarAxes):

        name = 'radar'
        # use 1 line segment to connect specified points
        RESOLUTION = 1

        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            # rotate plot such that the first axis is at the top
            self.set_theta_zero_location('N')

        def fill(self, *args, closed=True, **kwargs):
            """Override fill so that line is closed by default"""
            return super().fill(closed=closed, *args, **kwargs)

        def plot(self, *args, **kwargs):
            """Override plot so that line is closed by default"""
            lines = super().plot(*args, **kwargs)
            for line in lines:
                self._close_line(line)

        def _close_line(self, line):
            x, y = line.get_data()
            # FIXME: markers at x[0], y[0] get doubled-up
            if x[0] != x[-1]:
                x = np.concatenate((x, [x[0]]))
                y = np.concatenate((y, [y[0]]))
                line.set_data(x, y)

        def set_varlabels(self, labels):
            self.set_thetagrids(np.degrees(theta), labels)

        def _gen_axes_patch(self):
            # The Axes patch must be centered at (0.5, 0.5) and of radius 0.5
            # in axes coordinates.
            if frame == 'circle':
                return Circle((0.5, 0.5), 0.5)
            elif frame == 'polygon':
                return RegularPolygon((0.5, 0.5), num_vars,
                                      radius=.5, edgecolor="k")
            else:
                raise ValueError("unknown value for 'frame': %s" % frame)

        def _gen_axes_spines(self):
            if frame == 'circle':
                return super()._gen_axes_spines()
            elif frame == 'polygon':
                # spine_type must be 'left'/'right'/'top'/'bottom'/'circle'.
                spine = Spine(axes=self,
                              spine_type='circle',
                              path=Path.unit_regular_polygon(num_vars))
                # unit_regular_polygon gives a polygon of radius 1 centered at
                # (0, 0) but we want a polygon of radius 0.5 centered at (0.5,
                # 0.5) in axes coordinates.
                spine.set_transform(Affine2D().scale(.5).translate(.5, .5)
                                    + self.transAxes)
                return {'polar': spine}
            else:
                raise ValueError("unknown value for 'frame': %s" % frame)

    register_projection(RadarAxes)
    return theta

def example_data():
    data = [
             ['CD',  'TD', 'GD(f)', 'Den',  'PAR', 'Rt', 'TFC', 'Eft', 'SZZ'],
        ('', [
             [ 85,     5,    14,     12,     49,   43,    4,       3,      20],
             [ 59,     1,    10,      6,     36,   34,    11,      9,      25]])
    ]
    return data
# def example_data():
#     data = [
#         ['CD',  'Den' ,  'TD', 'GD(f)', 'Eft', 'SZZ', 'TFC', 'PAR', 'Rt'],
#         ('', [
#             [ 85,   12,    5 ,  14,    3,   20,   4,   49,  43],
#             [ 59,    6,    1 ,  10,    9,   25,   11,   36,  34]])
#     ]
#     return data

if __name__ == '__main__':
    N = 9
    theta = radar_factory(N, frame='polygon')
     
    data = example_data()
    spoke_labels = data.pop(0)
    print(spoke_labels)
    fig, axes = plt.subplots(figsize=(12, 4), nrows=2, ncols=1,
                             subplot_kw=dict(projection='radar'), linewidth=4.0, dpi=120, squeeze=True)
    fig.subplots_adjust(wspace=0.25, hspace=0.20, top=0.95, bottom=0.05)

    colors = ['tab:orange', 'tab:green']
    # Plot the four cases from the example data on separate axes
    for ax, (title, case_data) in zip(axes.flat, data):
        #ax.set_rgrids([0.2, 0.4, 0.6, 0.8])
        ax.set_rgrids([10,20,30,40,50,60,70,80,90,100], '', angle=45.)

        ax.set_title(title, weight='bold', size='medium', position=(0.5, 1.1),
                     horizontalalignment='center', verticalalignment='center')
        for d, color in zip(case_data, colors):
            ax.plot(theta, d, color=color, marker='*', markersize=2, markerfacecolor='m', markeredgecolor='k')
            ax.fill(theta, d, facecolor=color, alpha=0.50)
        ax.set_varlabels(spoke_labels)

    # add legend relative to top-left plot
    ax = axes[0]
    labels = ('Cat-3', 'Cat-2')
    legend = ax.legend(labels, loc=(0.65, .98),
                      labelspacing=0.1, fontsize='medium')

    #fig.text(0.5, 0.965, '5-Factor Solution Profiles Across Four Scenarios',horizontalalignment='center', color='black', weight='bold',size='large')

    plt.show()
