function [v,a] = projectile(r,t)
%This function has two inputs: initial velocity and initial launch angle.
%The two outputs are the distance traveled by the projectile and time lapsed traveling that distance.
%Define the gravitational constant. We will use this as acceleration
g = -9.81;

%Ask for inputs for 'v' and 'a'
v = input('initial velocity?');
a = input('launch angle?');

%Find the x and y components of initial velocity
xvel = v*cos(a);
yvel = v*sin(a);

%Define an equation for time. Since we know the final velocity in the x-direction will be 0, then time is:
t = -xvel/g;

%Now that we have 't' we can find the distance traveled by the projectile
r = xvel*t+0.5*g*t^2;
end