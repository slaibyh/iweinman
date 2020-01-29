%Use 'Import Data' Button in the home tab to load in 'GlobalCarbonBudget2018' and 'GlobalTempbyYear
GCB = xlsread('GlobalCarbonBudget2018.xlsx','Global Carbon Budget');
GTBY = textread('GlobalTempbyYear.txt');
%Make 'GCB' and GTBY tables
GCB = array2table(GCB);
GTBY = array2table(GTBY)
%'array2table' taken from https://www.mathworks.com/matlabcentral/answers/126422-how-to-convert-double-precision-array-to-table
%The first year GCB is 1959 but in the question it says 1850?
%Use 'cumsum' to find the cumulative sum of 'GCB2' and 'GC3'
CS = cumsum(GCB.GCB2 & GCB.GCB3);
%Create a table for the last 59 rows of 'GTBY2', 'GTBY11', and 'GTBY12' 
NGTBY= table(GTBY.GTBY2(111:169),GTBY.GTBY11(111:169), GTBY.GTBY12(111:169));
newtable = table(GCB.GCB2, GCB.GCB3, CS, NGTBY.Var1, NGTBY.Var2, NGTBY.Var3);


