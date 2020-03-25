import pandas as pd
import numpy as np

Years = np.arange(1850,2018)

#Import 'GlobalTempbyMonth.txt' and 'climate.txt'
#Globtemp = pd.DataFrame(pd.read_table('GlobalTempbyMonth.txt',usecols=[0,1],dtype=str))
climate = pd.DataFrame(pd.read_table('climate.txt',sep=','))

#Add a column containing the amount of carbon added every year and a year column
climate['YearlyEmissions'] = climate.ffai+climate.luce
climate['Year'] = Years


#1 and 2) This function returns the hottest ten years or the ten years with the most carbon based on the input
def topten(str):
    if str == 'Years':
        sortedclimate = climate.sort_values('AvgTemp',ascending=False)
        sctopten = sortedclimate.head(10)
        topten = sctopten.Year
    elif str == 'Carbon':
        sortedclimate = climate.sort_values('YearlyEmissions',ascending=False)
        sctopten = sortedclimate.head(10)
        topten = sctopten.Year
    else:
        print("Please input 'Years' or 'Carbon'")
    return topten