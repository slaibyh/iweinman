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
       [mass,~, BEPN] = massformula(A,Z);
       
       figure(1);
       hold on%We need a hold becuase we are doing 2 plots in 1
       plot(Z,mass, 'k-')%black line
       plot(Z,awm, 'ro')%red circles
       title('Mass vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('Mass (MeV)')
       legend('Line = Semi-Empirical Formula Mass vs. Atomic Number', 'Markers = Atomic Weight Mass vs. Atomic Number')
       hold off
       
       figure(2);
       plot(Z,BEPN(:,end))
       title('Binding Energy per Nucleon vs. Atomic Number')
       xlabel('Atomic Number')
       ylabel('BEPN (MeV)')
       
       %Assign the two graphs to an output argument
       varargout{1} = {figure(1),figure(2)};
       
elseif nargin == 1
        if ~isnumeric(varargin{1})%check that the input is numeric
            error('Please input a numeric value for Atomic Number')
        end
        if varargin{1} <= 0 || varargin{1} > 118%check that the input is between 1 and 118
            error('Please input a value between 1 and 118')
        end
        
        %Define variables for A and Z
        Z = varargin{1};
        A = table.AtomicWeight(table.AtomicNumber==Z);
        
        %Calculate mass using 'massformula'
        [mass] = massformula(A,Z);
        
        %Display mass, the specified row, and create an output argument
        disp("Mass = "+mass+" MeV");
        disp(table(Z,:));
        varargout{1} = {mass,table(Z,:)};
        
elseif nargin == 2
        %if both arguments are numeric do this:
        if isnumeric(varargin{2})
      
        %Assign variables for A and Z
        Z = varargin{1};
        A = varargin{2};
        if ~isnumeric(Z)%Check that the first input is numeric
            error('Please input a numeric value for atomic number')
        end
        if ~isnumeric(A)%Check that the second input is numeric
            error('Please input a numeric value for number of nucleons')
        end
       
        %Calculate mass and determine stability of the isotope
        [mass,be] = massformula(A,Z);
        if be <= 0
           stability = "Isotope is unstable :(";
        else 
           stability = "Isotope is stable :)";
        end
        
        %Display mass and assign output arguments for mass and stability
        disp("Mass = "+mass+" MeV")
        varargout{1} = {mass,stability};
        end
        
        %if one argument is numeric and one argument is a char do this:
        if ischar(varargin{2}) 
       
        %calculate mass
        Z = varargin{1};
        A = table.AtomicWeight(table.AtomicNumber==Z);
        [mass,~] = massformula(A,Z);
        
        %check that the second argument is one of the column titles
        if ~strcmp(varargin{2}, table.Properties.VariableNames) %Thank you https://www.mathworks.com/matlabcentral/answers/3481-equal-cell for 'strcmp'
            error('Please enter the title of a column in table')
        end
        
        %display mass and corresponding cell that is in specified column 
        disp("Mass = "+mass+" MeV")
        disp(table(Z,varargin{2}))
        
        %Assign mass and specified cell to an output argument
        varargout{1} = {mass,table(Z,varargin{2})};
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
