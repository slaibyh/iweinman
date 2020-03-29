import pandas as pd
import numpy as np
import matplotlib.pyplot as p

#Import 'GlobalTempbyMonth.txt' and 'climate.txt'
GlobTemp = pd.DataFrame(pd.read_table('GlobalTempbyMonth.txt',sep="   ",header = None,usecols = [0, 1],names = ['Month','AvgTemp'],engine = 'python'))
climate = pd.DataFrame(pd.read_table('climate.txt',sep=','))

#Add a column containing the amount of carbon added every year and a column containing the years (1850-2017)
climate['YearlyEmissions'] = climate.ffai+climate.luce
Years = np.arange(1850,2018)
climate['Year'] = Years

#1 and 2) This function returns the ten hottest years or the ten years with the most carbon emissions based on the input
def topten(str):
    if str == 'Heat':
        sortedclimate = climate.sort_values('AvgTemp',ascending=False)
        sctopten = sortedclimate.head(10)
        topten = sctopten.Year
    elif str == 'Carbon':
        sortedclimate = climate.sort_values('YearlyEmissions',ascending=False)
        sctopten = sortedclimate.head(10)
        topten = sctopten.Year
    else:
        print("Please input 'Heat' or 'Carbon'")
    return topten

#3) Is there a relationship between the ten hottest years and the ten years with the most carbon emissions?
def relategraph():
    p.plot(topten('Carbon'),topten('Heat'))
    p.ylabel("Hottest Years")
    p.xlabel("Highest Carbon Emission Years")
    p.title("Relation?")
    p.show()
    print('There does not seem to be a relationship based on the graph')
    return

#Function to find the 20 hottest months in 'GlobTemp'
def toptwenty():
    sortedGlobTemp = GlobTemp.sort_values('AvgTemp',ascending=False)
    sGTtoptwenty = sortedGlobTemp.head(20)
    toptwenty = sGTtoptwenty.Month
    return toptwenty

#Is there any overlap between the hottest months and the hottest years?
def overlap(y=topten('Heat'),m=toptwenty()):
    o = np.equal(y,m)
    return o

#Create a data frame of years, sorted by global average temperature, highest to lowest
sortclimate = climate.sort_values('AvgTemp',ascending=False)
almostrecords = sortclimate.Year
records = pd.DataFrame(almostrecords)

#Function that writes data into an excel spreadsheet. Thank you https://xlsxwriter.readthedocs.io/example_pandas_multiple.html for the help with this
def excel():
    writer = pd.ExcelWriter('climate.xlsx', engine = 'xlsxwriter')
    climate.to_excel(writer,sheet_name='climate')
    GlobTemp.to_excel(writer,sheet_name='Monthly Temps')
    records.to_excel(writer,sheet_name='records')
    writer.save()
    return 