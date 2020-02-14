%Define the constants: radius of Earth, graviational constant, mass of Earth
R = 6.371E6; 
G = 6.67E-11;
M = 5.98E24;

%Ask for the period with units and make it a string
I = input("Input orbital period in 'seconds' 'minutes' 'hours' or 'days'", 's'); 

%Split 'I' so that we can check if the period is numeric and convert the units to seconds
SplitI = split(I);

%Define variables for the period and the units that are asked for in 'I'
Period = str2num(SplitI{1});
Units = SplitI{2};
%Turn the period part of the string into a number


%Check if 'Period' is empty(if the input is not a number, it will be empty. If not, output an error
if isempty(Period)
    error("Please input a number for period")
end

%Convert 'Units' to seconds
switch Units
    case 'seconds'
        Period = Period;
    case 'minutes'
        Period = Period*60;
    case 'hours'
        Period = Period*3600;
    case 'days'
        Period = Period*86400;
    otherwise
        error('Please input a period with correct units'); %in case someone inputs a period without units or with the wrong units
end


%Calculate orbital height and velocity
h = round((((G*M*T.^2)/(4*pi^2)).^(1/3)-R)./1000); %in kilometers
v = round((2*pi*R)/T)/1000; %in kilometers/second

%Display the orbital height and velocity
disp(h);
disp(v);

%Check if 'h' is less than 0 aka below the surface of Earth. If it is, ask for another input
if h <= 0
    error("Height should not be less than zero. Please try another period")
end
