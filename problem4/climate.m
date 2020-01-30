%1)
%Import 'GlobalCarbonBudget.xlsx' & 'GlobalTempYear.txt' as tables
GlobCarbBud = array2table(xlsread('GlobalCarbonBudget2018.xlsx','Historical Budget'));
GlobCarbBud.Properties.VariableNames = {'Year' 'ffai' 'luce' 'ag' 'os' 'ls' 'bi'};
GlobTempByYear = array2table(textread('GlobalTempbyYear.txt'));
GlobTempByYear.Properties.VariableNames = {'Year' 'AvgTemp' '3' '4' '5' '6' '7' '8' '9' '10' 'lower bound' 'upper bound'};
%'array2table' taken from https://www.mathworks.com/matlabcentral/answers/126422-how-to-convert-double-precision-array-to-table

%2)
%Use 'cumsum' to find the cumulative sum of 'GCB2' and 'GCB3'
CumSum = cumsum(GlobCarbBud.ffai(101:268) & GlobCarbBud.luce(101:268));

%3)
%Create a new table for with fossil fuel and industry emissions, land-use change emissions, the cumulative sum of carbon emissions, the average global temperature, and the lower and upper bounds of the 95% confidence interval of the combined effects
