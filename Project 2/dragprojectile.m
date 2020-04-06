function [varargout] = dragprojectile(v,ang,h,graph)
%DRAGPROJECTILE Is a function for projectile motion that takes into account
%air resistance. It takes 0-3 arguments (velocity, angle, initial height) and
%returns max height, range, and final time. 

%Define default values
if nargin==0
    v=30;
    ang=45;
    h=0;
    graph=1;
elseif nargin==1
    ang=45;
    h=0;
    graph=1;
elseif nargin==2
    h=0;
    graph=1;
elseif nargin==3
    graph=1;
end

%Testing validity of input
if v <= 0
    error('Please input a positive value for velocity')
elseif ang <= 0 || ang >= 90
    error('Please input an angle between 0 and 90 degrees')
elseif h < 0
    error('Please input a positive value for initial height')
end

%Define coefficients
C = 0.5; %drag coeffeicient of a smooth sphere https://www.grc.nasa.gov/WWW/K-12/airplane/balldrag.html
rho = 1.225; %density of air
A = .2; %cross sectional area of projectile
m = 2; %mass of projectile
g = 9.81; %gravitational constant

%Both position functions combine the coeffeicients in the same way
drag = -(C*rho*A)/(2*m);

%x/y components and initial conditions
x = 0;
y = h;
vx = v*cosd(ang);
vy = v*sind(ang);
icx = [x vx];
icy = [y vy];

%times
tf = (vy+sqrt(vy^2+2*g*h))/g;
tsteps = [0 tf];

%solving odes
opts = odeset('refine',10);
[tx x] = ode45(@xode,tsteps,icx,opts,drag);
[ty y] = ode45(@yode,tsteps,icy,opts,drag,g);

%variables needed for outputs
ypos = y(y(:,1)>=0); %y-position
ynum = numel(ypos); %number of all y-positions

%finding outputs
hmax = max(ypos); %maximum height
r = x(ynum); %range
tf = ty(ynum); %final time
varargout{1} = table(hmax,r,tf);

if graph
    plotx = x(1:ynum);
    ploty = y(1:ynum);
    plot(plotx,ploty);
    xlabel('x position (m)');
    ylabel('y position (m)');
    title('Projectile Motion with Drag');
end
end

%These functions return arrays of velocity and position
function dxdt = xode(tx,x,drag)
dxdt = [x(2);drag*x(2)^2];
end

function dydt = yode(ty,y,drag,g)
dydt = [y(2);-g+(drag*y(2)^2)];
end


