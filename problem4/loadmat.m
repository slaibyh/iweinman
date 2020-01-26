% Starting point for Problem 4
load('smallperiodictable')

%1)
%Define a variable for all elements that have a density greater than water
d=density > 1;
%Find which elements' densities are greater than 1
D=find(d);
%Display the names of the elements defined by "D"
names(D);
%Count all the elements in "D"
numel(D);

%2)
%Define a variable for all elements with over 100 isotopes
i=isotopes>100;
%Find which elements have over 100 isotopes
I=find(i);
%Display the names of the elements defined by "I"
names(I);
%Count all the elements in "I"
numel(I);

%3)
%Define a variable for all elements that were discovered before 1900
y=discyear<1900;
%Find which elements were discovered before 1900
Y=find(y);
%Display the names of the elements defined by "Y"
names(Y);
%Count all the elements in "Y"
numel(Y);

%4)
plot(atomicweight,density);
%There does not appear to be a clear relationship between atomic weight and
%density. 

