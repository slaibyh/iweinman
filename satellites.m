%Define the constants: radius of Earth, graviational constant, mass of Earth
R = 6.371E6; 
G = 6.67E-11;
M = 5.98E24;
%Ask for the period with units and make it a string
I = input("Input orbital period in 'seconds' 'minutes' 'hours' or 'days'", 's'); 
%Split 'I' so 
SplitI = split(I);
Units = SplitI{2};
T = str2num(SplitI{1});
%Convert 'Units' to seconds
switch Units
    case 'seconds'
        T = T;
    case 'minutes'
        T = T*60;
    case 'hours'
        T = T*3600;
    case 'days'
        T = T*86400;
    otherwise
        error('Please input a period with units'); %in case someone inputs a period without units or with the wrong units
end

%Calculate orbital height and velocity
h = round((((G*M*T.^2)/(4*pi^2)).^(1/3)-R)./1000); %in kilometers
v = round((2*pi*R)/T); %in meters/second

disp(h);
disp(v);

%Check if 'h' is less than 0 aka below the surface. If it is, ask for another input
if h <= 0
    error("Height should not be less than zero. Please try another period")
end

