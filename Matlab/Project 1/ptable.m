function [varargout] = ptable(varargin)
% this line just outputs whatever is inputted
if nargin==1
    varargout{1}=varargin{1};
else
    varagarout = varargin;
end


end

function [mass, be, bepn] = massformula(A,Z)
%MASSFORMULA calculates the mass of an atomic nuclei with Z protons and A-Z
%neutrons using the semi-empirically mass formula (units in MeV), and
%outputs the MASS (in MeV), BE (binding energy), and BEPN (binding energy per nucleon)

% Quantities in MeV/c^2
mp = 938.27;
mn = 939.57;
av = 15.8;
as = 18.3;
ac = 0.714;
aa = 23.2;
ap = 11.2;
format bank
be = av*A - as*A^(2/3) - ac*Z*(Z-1)/A^(1/3)-aa*(A-2*Z)^(2)/A;
% the next if statements don't work, the percent signs are trying to mod A
% and mod Z, but you need to look up the syntax and figure out what is
% going on below. Or we could do it together in class on 2/11
if mod(A,2)==0
    if mod(Z,2)==0
        be = be + ap/sqrt(A);
    else
        be = be - ap/sqrt(A);
    end
end
bepn = be/A;
mass = Z*mp+(A-Z)*mn-be;

end