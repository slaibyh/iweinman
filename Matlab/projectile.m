function [r,t] = projectile(iv,units,la,h)
%PROJECTILE can be run with 0-3 arguments. The three possible
%arguments it takes are initial velocity (in m/s or mph), launch angle (in
%degrees), and height (in meters). It calculates the range and the time
%spent in the air. Lastly, it will plot the trajectory of the projectile.
%Define the gravitational constant. We will use this as acceleration
g = 9.81;

%Define initial conditions if the function is run without any inputs
if nargin == 0
    iv = 15;
    units = 'm/s';
    la = 30;
    h = 0;
elseif nargin == 1
    units = 'm/s';
    la = 30;
    h = 0;
elseif nargin == 2
    la = 30;
    h = 0;
elseif nargin == 3
    h = 0;
else 
    if h <= 0
        error('Please input a positive value for height') %Make sure that the height is greater than 0
    end
end

switch units
    case 'm/s'
        iv = iv;
    case 'mph'
        iv = iv/2.237; %conversion factor taken from Google
end

%Equations for range and time
r = iv^2*sind(2*la)/g;
t = 2*(2*iv*sind(la))/g;

%Define the axes for the plot of the projectile
stepsize = t/1000;
time = [0:stepsize:t];
xaxis = iv*cosd(la)*time;
yaxis = h + iv*time-.5*g*time.^2;

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