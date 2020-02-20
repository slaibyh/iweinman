function [r,t] = projectile(iv,la,h)
%This function has three default inputs: initial velocity (m/s or mph) and initial launch angle (degrees).
%The two outputs are the distance traveled by the projectile and time lapsed traveling that distance.
%Define the gravitational constant. We will use this as acceleration
g = 9.81;

%Define initial conditions if the function is run without any inputs
if nargin == 0
    iv = '15 m/s';
    la = 30;
    h = 0;
elseif nargin == 1
    la = 40;
    h = 0;
elseif nargin == 2
    h = 0;
    if la <= 0 || la >= 90
        error('Please input an angle between 0 and 90 degrees') %Make sure that the angle is between 0 and 90 degrees
    end
else 
    if h <= 0
        error('Please input a positive value for height') %Make sure that the height is greater than 0
    end
end

%Make sure that the units are in m/s for the calculations
splitiv = split(iv);
units = splitiv{2};
switch units
    case 'm/s'
        iv = iv;
    case 'mph'
        iv = iv/2.237 %conversion factor taken from Google
end

%Since we made iv a string we need to define a variable for the numeric part of it
ivspeed = splitiv{1};
speed = str2num(ivspeed);

%Equations for range and time
r = speed*cosd(la)*(speed*sind(la)+sqrt(speed*sind(la)+2*g*h))/g;
t = 2*(speed*sind(la) + sqrt((speed*sind(la))^2+2*g*h))/g;

%Define the axes for the plot of the projectile
stepsize = t/1000;
time = [0:stepsize:t];
xaxis = speed*cosd(la)*time;
yaxis = h + speed*time-.5*g*time.^2;

%Make sure the title, axes, and axes labels are good
title('Trajecotry of Projectile')
ylabel('height (m)')
xlabel('distance (m)')
ylim([0 inf])
xlim([0 inf])
grid on

%Make the animation for the projectile
motion = animatedline;
for i = 1:length(time)
    addpoints(motion,xaxis(i),yaxis(i))
    drawnow   
end
end