%Imports smallperiodictable.txt into Matlab
SPT = readtable('smallperiodictable.txt');
%Name each column in SPT
SPT.Properties.VariableNames = {'AtomicNum' 'Element' 'Symbol' 'AtomicWeight' 'Density' 'Isotopes' 'DiscYear'};
%Turns SPT into a structure
SPTS = table2struct(SPT);

%1)
%Define a variable for all the elements that are more dense than mercury and have less than 30 isotopes
DM = SPT.Element(SPT.Density > SPT.Density(80) & SPT.Isotopes < 30);
%Count the elements in 'DM' and put them in alphabetical order
numel(DM);
sort(DM);
%'sort' command taken from https://www.mathworks.com/matlabcentral/answers/910-is-there-a-method-to-sort-a-list-an-array-of-words-alphabetically-natural-order-sorting

%2)
%Define a variable for  the average atomic weight of the elements that were discovered during the 20th century
AAW = mean(SPT.AtomicWeight(SPT.DiscYear >= 1900 & SPT.DiscYear < 2000));
%Define a variable for the symbols of the elements discovered during the 20th century
Sym = SPT.Symbol((SPT.DiscYear >= 1900 & SPT.DiscYear < 2000));

%3)
%Rearrange SPT to be in denscedning order of amount of isotopes
RSPT = sortrows(SPT, 6, 'descend'); %sortrows taken from 'doc sortrows'
%Define a variable for the first 10 elements in the new table
TopTen = RSPT.Element(1:10);

%4) Personally, I think working with tables is easier. It would be
%advantageous to use a structure when you need all the data from a certain
%row rather than a column.



