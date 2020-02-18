function [r,t] = projectile(iv,la,h)
%This function has three default inputs: initial velocity (m/s or mph) and initial launch angle (degrees).
%The two outputs are the distance traveled by the projectile and time lapsed traveling that distance.
%Define the gravitational constant. We will use this as acceleration
g = 9.81;

if nargin == 0
    iv = 15;
    la = 30;
    h = 0;
elseif nargin == 1
    la = 40
    h = 0
elseif nargin == 2
    h = 0
    if la <= 0 || la >= 90
        error('Please input an angle between 0 and 90 degrees')
    end
else 
    if h <= 0
        error('Please input a positive value for height')
    end
end

r = iv*cosd(la)*(iv*sind(la)+sqrt(iv*sind(la)+2*g*h))/g;
t = 2*(iv*sind(la) + sqrt((iv*sind(la))^2+2*g*h))/g;


stepsize = t/1000;
time = [0:stepsize:t];
xaxis = iv*cosd(la)*time;
yaxis = h + iv*time-.5*g*time.^2;

title('Trajecotry of Projectile')
ylabel('height (m)')
xlabel('distance (m)')
ylim([0 inf])
xlim([0 inf])
grid on

motion = animatedline;
for i = 1:length(time)
    addpoints(motion,xaxis(i),yaxis(i))
    drawnow %I can't firgure out why this only draws the upwards motion  
end
end