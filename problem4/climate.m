%Import 'GlobalCarbonBudget.xlsx' & 'GlobalTempYear.txt' as tables
GCB = array2table(xlsread('GlobalCarbonBudget2018.xlsx','Global Carbon Budget'));
GTBY = array2table(textread('GlobalTempbyYear.txt'));
%'array2table' taken from https://www.mathworks.com/matlabcentral/answers/126422-how-to-convert-double-precision-array-to-table
%Use 'cumsum' to find the cumulative sum of 'GCB2' and 'GC3'
CS = cumsum(GCB.Var2 & GCB.Var3);
%Create a table for the last 59 rows of 'GTBY2', 'GTBY11', and 'GTBY12' 
NGTBY= table(GTBY.Var2(111:169),GTBY.Var11(111:169), GTBY.Var12(111:169));
newtable = table(GCB.Var2, GCB.Var3, CS, NGTBY.Var1, NGTBY.Var2, NGTBY.Var3);

%The first year in GCB is 1959 but in the question it says 1850?


