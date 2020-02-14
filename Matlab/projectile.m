function [p,t] = projectile(iv,la,ih)
%This function has three default inputs: initial velocity (m/s or mph) and initial launch angle (degrees).
%The two outputs are the distance traveled by the projectile and time lapsed traveling that distance.
%Define the gravitational constant. We will use this as acceleration
g = -9.81;

switch nargin
    case 0
        iv=50
        la=50
        ih=0
    case 1
        la=50
        ih=0
    case 2
        ih=0
        if la <= 0 || la >= 90
    error('Please input an angle between 0 and 90 degrees')
end
    case 3
        iv=iv
        la=la
         if la <= 0 || la >= 90
    error('Please input an angle between 0 and 90 degrees')
end
        ih=ih
        if ih <=0
            error('Please input a proper intitial height')
        end
    otherwise
        error("Please input valid arguments")
end

xvel = iv*cosd(la)
yvel = iv*sind(la)
t = (-xvel/g)
p = (xvel*t)+(0.5*g*(t^2))


end

