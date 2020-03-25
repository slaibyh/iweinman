import pandas as pd


Globtemp = pd.DataFrame(pd.read_table('GlobalTempbyMonth.txt',sep="   ",header=None, usecols = [0, 1], names=['date', 'avgtemp']))
#clim = pd.DataFrame(pd.read_table('climate.txt',sep=','))