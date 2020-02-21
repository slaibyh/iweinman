function [varargout] = ptable(varargin)
% PTABLE Takes 0-2 arguments. 0 arguments will result in 2 outputs: One will be a 
%graph with 2 lines: mass (calculated by the Semi-Empircial formula) vs atomic number 
%and mass (calculated from the atomic weight) vs atomic number. 
%The other will be a graph of binding energy per nucleon vs atomic number.
%1 numeric argument (atomic number) will result in 2 outputs: One is the
%mass of the element (calculated by the Semi-Empircial formula). The other
%is a structure or table containing all the info about that element.
%2 numeric arguments (atomic number and total number of nucleons) will
%result in two outputs: One is the mass of the isotope (calculated by the
%Semi-Empircial formula). The other is whether it is stable.
%1 numeric  argument (atomic number) and 1 character argument (the name of
%a field/column in the .csv file) will result in 2 outputs. One will be the
%mass of the element (calculated by the Semi-Empircial formula). The other
%will be the value within that field (which itself could be numeric, char, or string)

%Import 'periodictabledata.csv'
table = readtable('periodictabledata.csv');

if nargin == 0
        A = table.AtomicWeight;
        Z = table.AtomicNumber;
        awm = A*931.5; %mass calculated from atomic weight
       [mass, be, BEPN] = massformula(A,Z);
       
       figure(1)
       hold on%We need a hold becuase we are doing 2 plots in 1
       plot(Z,mass, 'k-')
       plot(Z,awm, 'ro')
       title('Mass vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('Mass (MeV)')
       legend('Line = Semi-Empirical Formula Mass vs. Atomic Number', 'Markers = Atomic Weight Mass vs. Atomic Number')
       hold off
       
       figure(2)
       plot(A,BEPN(:,end))
       title('Binding Energy per Nucleon vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('BEPN (MeV)')
       
elseif nargin == 1
        singlearg = cell2mat(varargin);%turn varargin into a matrix so we can work with it
        if ~isnumeric(singlearg)%check that the input is numeric
            error('Please input a numeric value for Atomic Number')
        end
        if singlearg <= 0 || singlearg > 118%check that the input is between 1 and 118
            error('Please input a value between 1 and 118')
        end
        Z = singlearg;
        %Define a variable for the row of the input
        R = find(table.AtomicNumber==singlearg);
        %Define a variable for the Atomic Weight in the row of the input
        A = table.AtomicWeight(R);
        
        %Calculate mass using 'massformula'
        [mass] = massformula(A,Z);
        
        %Create a new table that is just the row of the input
        newtable = table(singlearg,:);
        
        %Display the mass and newtable of the input
        disp("Mass = " +mass+ " MeV")
        disp(newtable)
        
elseif nargin == 2
        arg1 = cell2mat(varargin(1));
        arg2 = cell2mat(varargin(2));
       if ~isnumeric(arg1)%Check that the first input is numeric
           error('Please input a numeric value for atomic number')
       elseif ~isnumeric(arg2)%Check that the second input is numeric
           error('Please input a numeric value for number of nucleons')
       end
       
       %Define variables for A and Z
       Z = arg1;
       A = arg2;
       
       [mass, be] = massformula(A,Z);
       disp("Mass = "+mass+" MeV")
       if be <= 0
           error('Isotope is unstable')
       else 
           disp('Isotope is stable!')
       end
       
else
        arg1 = cell2mat(varargin(1));
        arg2 = varargin(2);
         if ~isnumeric(arg1)%Check that the first input is numeric
           error('Please input a numeric value for atomic number')
         end
         
         Z = arg1;
         preA = find(table.AtomicNumber==arg1);
         A = table.AtomicWeight(preA);
         [mass] = massformula(A,Z);
         
end


end

function [mass, be, BEPN] = massformula(A,Z)
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
be = av.*A - as.*A.^(2/3) - ac.*Z.*(Z-1)/A.^(1/3)-aa.*(A-2.*Z).^(2)./A;

if mod(A,2)==0
    if mod(Z,2)==0
        be = be + ap/sqrt(A);
    else
        be = be - ap/sqrt(A);
    end
end
BEPN = be./A;
mass = Z*mp+(A-Z)*mn-be;

end
