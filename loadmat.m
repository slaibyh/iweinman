% Starting point for Problem 4
load('smallperiodictable')
%Define a variable for all elements that have a density greater than water
d=density > 1;
%Find which elements' densities are greater than 1
D=find(d);
%Display the names of the elements defined by "D"
n=names(D)
%Count all the elements in "D"
numel(n)