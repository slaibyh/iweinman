v=[3,-2,5,7,-3];
u=[5,3,-1,-1,9];
A =[-3,-3,-4,-9,-8;-6,7,5,-9,1;-5,2,5,1,-1;2,1,-3,6,-10;-1,9,1,9,-3];

v.*u; % The "." tells Matlab to multiply each element by each element. 
% ans = [15 -6 -5 -7 -27]. 

v*u'; % This is multiplying the two arrays together. The apostrophe changes
% a row vector into a column vecotr
% ans = -30 

v'*u; % The apostrophe turns "v" into a colum vector. The first row is the first
% element in "v" multiplied by all the elements of "u". The second row is the
% second element in "v" multiplied by all the values of "u". And so on.
% ans = 
%       15     9    -3    -3    27
%      -10    -6     2     2   -18
%       25    15    -5    -5    45  
%       35    21    -7    -7    63
%      -15    -9     3     3   -27. 

u/v; % WHY????
% ans = -0.3125.

u./v; %This divides each element by each element.
% ans = [1.6667 -1.5000 -0.2000 -0.1429 -3.0000]. 

% A*u gives an error because Matlab can not multiply a 5x5 array by a 1x5 array

A.*u; % The first row is each element of the first row of "A" multiplied by
% each element of "u". The second row is each element in the second row of
% "A" multiplied by each element of "u". And so on.
% ans = 
%      -15    -9     4     9   -72
%      -30    21     5     9     9
%      -25     6    -5    -1     9
%       10     3     3    -6   -90
%      -5     27    -1    -9   -27

A*v'; %This takes the sum of the products of each element in the first 
% row of "A" and the first row of "v". Then it takes the sum of the 
% products of each element in the second row of "A" and the second 
% row of "v". And so on.
% ans =
%      -62
%      -73
%       16
%       61
%       56

A^2; % WHY???
% ans = 
%       37  -101    -4   -76   139
%      -68    77   112   -49   137
%      -19    31    51    29    30
%       25   -89   -46   -84   -42
%      -35    50    24   -44   -65

A.^2; %This squares each element in "A".
% ans =
%       9     9    16    81    64
%      36    49    25    81     1
%      25     4    25     1     1
%       4     1     9    36   100
%       1    81     1    81     9

