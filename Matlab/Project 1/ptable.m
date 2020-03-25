function [varargout] = ptable(varargin)
% PTABLE Takes 0-2 arguments. 0 arguments will result in 2 outputs: One will be a 
%graph with a line of mass (calculated by 'massformula') vs atomic number 
%and markers of mass (calculated from the atomic weight) vs atomic number. 
%The other will be a graph of binding energy per nucleon (calculated by 
%'massformula') vs atomic number. 1 numeric argument (atomic number) will result
%in 2 outputs: One is the mass of the element (calculated by 'massformula'). 
%The other is a table containing all the info about that element. 
%2 numeric arguments (atomic number and total number of nucleons) will
%result in two outputs: One is the mass of the isotope (calculated by the
%Semi-Empircial formula). The other is whether or not the isotope is stable. 
%1 numeric  argument (atomic number) and 1 character argument (the name of
%a column in 'table') will result in 2 outputs: One will be the
%mass of the element (calculated by the Semi-Empircial formula). The other
%will be the cell in the row of the atomic number that is input and the
%column that is specified.

%Import 'periodictabledata.csv'
table = readtable('periodictabledata.csv');

if nargin == 0
        A = table.AtomicWeight;
        Z = table.AtomicNumber;
        awm = A*931.5; %mass calculated from atomic weight
       [mass, be, BEPN] = massformula(A,Z);
       
       plot1 = figure(1);
       hold on%We need a hold becuase we are doing 2 plots in 1
       plot(Z,mass, 'k-')%black line
       plot(Z,awm, 'ro')%red circles
       title('Mass vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('Mass (MeV)')
       legend('Line = Semi-Empirical Formula Mass vs. Atomic Number', 'Markers = Atomic Weight Mass vs. Atomic Number')
       hold off
       
       plot2 = figure(2);
       plot(Z,BEPN)%why are there two lines?
       title('Binding Energy per Nucleon vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('BEPN (MeV)')
       
elseif nargin == 1
        singlearg = varargin{1};
        if ~isnumeric(singlearg)%check that the input is numeric
            error('Please input a numeric value for Atomic Number')
        end
        if singlearg <= 0 || singlearg > 118%check that the input is between 1 and 118
            error('Please input a value between 1 and 118')
        end
        Z = singlearg;
        %Define a variable for the row of the input
        R = find(table.AtomicNumber==Z);
        %Define a variable for the Atomic Weight in the row of the input
        A = table.AtomicWeight(R);
        
        %Calculate mass using 'massformula'
        [mass] = massformula(A,Z);
        
        %Create a new table that is just the row of the input
        newtable = table(Z,:);
        
        %Display the mass and 'newtable'
        disp("Mass = " +mass+ " MeV");
        disp(newtable);
        
elseif nargin == 2 
        if isnumeric(varargin{2})
       %if both arguments are numeric do this:
        arg1 = varargin{1};
        arg2 = varargin{2};
        if ~isnumeric(arg1)%Check that the first input is numeric
            error('Please input a numeric value for atomic number')
        end
        if ~isnumeric(arg2)%Check that the second input is numeric
            error('Please input a numeric value for number of nucleons')
        end
       
        %Define variables for A and Z
        Z = arg1;
        A = arg2;
   
        %Calculate mass and determine stability of the isotope
        [mass, be] = massformula(A,Z);
        disp("Mass = "+mass+" MeV")
        if be <= 0
           disp('Isotope is unstable :(')
        else 
           disp('Isotope is stable :)')
        end
        end
        
        if ischar(varargin{2})
        %if one argument is numeric and one argument is a char do this: 
        numarg = varargin{1};
        chararg = varargin{2};
  
        %calculate mass
        Z = numarg;
        R = find(table.AtomicNumber==Z);
        A = table.AtomicWeight(R);
        [mass, be] = massformula(A,Z);
        
        %check that 'chararg' is one of the column titles
        if ~strcmp(chararg, table.Properties.VariableNames) %Thank you https://www.mathworks.com/matlabcentral/answers/3481-equal-cell for 'strcmp'
            error('Please enter the title of a column in table')
        end
        
        %display mass and corresponding cell that is in specified column 
        disp("Mass = "+mass+" MeV")
        disp(table(Z,chararg))
        end    
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
