%1)
%Import 'GlobalCarbonBudget.xlsx' & 'GlobalTempYear.txt' as tables
GlobCarbBud = array2table(xlsread('GlobalCarbonBudget2018.xlsx','Historical Budget'));
GlobCarbBud.Properties.VariableNames = {'Year' 'ffai' 'luce' 'ag' 'os' 'ls' 'bi'};
GlobTempByYear = array2table(textread('GlobalTempbyYear.txt'));
GlobTempByYear.Properties.VariableNames = {'Year' 'AvgTemp' '3' '4' '5' '6' '7' '8' '9' '10' 'lowerbound' 'upperbound'};
%'array2table' taken from https://www.mathworks.com/matlabcentral/answers/126422-how-to-convert-double-precision-array-to-table

%2)
%Use 'cumsum' to find the cumulative sum of 'GCB2' and 'GCB3'
CumSum = cumsum(GlobCarbBud.ffai(101:268) + GlobCarbBud.luce(101:268)); 

%3)
%Create a new table for with fossil fuel and industry emissions, land-use change emissions, the cumulative sum of carbon emissions, the average global temperature, and the lower and upper bounds of the 95% confidence interval of the combined effects
NewTable = table(GlobCarbBud.ffai(101:268), GlobCarbBud.luce(101:268), CumSum(1:168), GlobTempByYear.AvgTemp(1:168), GlobTempByYear.lowerbound(1:168), GlobTempByYear.upperbound(1:168));
NewTable.Properties.VariableNames = {'ffai' 'luce' 'CumSum' 'AvgTemp' 'lowerbound' 'upperbound'};

%4i)
%Create a plot of 'GlobTempByYear.Year' and 'NewTable.CumSum' vs year
x = GlobTempByYear.Year(1:168);
y = NewTable.AvgTemp;
yyaxis left
plot(x,y);

%add the right y-axis
r = NewTable.CumSum;
yyaxis right
plot(x,r)

%add a title and labels
yyaxis left
title('AvgTemp and CumSum vs Year')
xlabel('Year')
ylabel('AvgTemp')

yyaxis right
ylabel('Cumsum')

%4ii)
%same plot as 4i with error bars on AvgTemp
x = GlobTempByYear.Year(1:168);
laxis = NewTable.AvgTemp;
yyaxis left
plot(x,laxis);
figure () 
errorbar(x, laxis, NewTable.lowerbound, NewTable.upperbound);

raxis = NewTable.CumSum;
yyaxis right
plot(x,raxis);

title('AvgTemp and CumSum vs Year');
xlabel('Year');
ylabel('AvgTemp');
yyaxis right
ylabel('Cumsum');

%4iii)
%create a scatter plot of NewTable.AvgTemp vs NewTable.CumSum
figure ()
ScatterPlot = scatter(NewTable.CumSum, NewTable.AvgTemp); 
title('Scatterplot of AvgTemp vs CumSum')
ylabel('AvgTemp')
xlabel('CumSum')

%5)
%save 'climate.m' as a .mat file
save('climate.mat');

%6)
%save 'climate.m' as a .txt file
save('climate.txt');
