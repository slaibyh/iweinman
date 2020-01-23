% Starting point for Problem 4
load('smallperiodictable')
%Define a variable for all elements that have a density greater than water
d=density > 1;
%Find which elements' densities are greater than 1
D=find(d);
%Display the names of the elements defined by "D"
n=names(D);
%Count all the elements in "D"
numel(n);
%Define a variable for all elements that have over 100 isotopes
i= isotopes > 100;
%Find which elements have over 100 isotopes
I=find(i);
%Display the names of the elements defined by "I"
