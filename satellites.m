%Input
T= input("minutes"); 
%Define the constants:radius of Earth,graviational constant,mass of Earth
R=6.371E6;
G=6.67E-11;
M=5.98E24;
%Convert to seconds
T=T*60;
h=((G*M*T^2)/(4*pi^2))^(1/3)-R; %in meters
%Convert h to kilometers
h=h/1000;
%New R is the radius of Earth plus the height of the satellite
R=R+h;
%Calculating the velocity of a satellite at a given period
v=(2*pi*R)/T;
disp(round(v))
disp(round(h))

