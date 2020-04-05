#This program contains functions for projectile motion that take into account drag forces

from scipy.integrate import odeint
import numpy as np
import matplotlib.pyplot as plt

#Define coefficients
C = 0.5 #drag coeffeicient of a smooth sphere https://www.grc.nasa.gov/WWW/K-12/airplane/balldrag.html
rho = 1.225 #density of air from Google
A = .2 #cross-sectional area of projectile
m = 2 #mass of projectile
g = 9.81 #gravitational constant

#Both position functions combine the coeffeicients in the same way
drag = -(C*rho*A)/(2*m)

#These functions return an array of the velocity and position. We will need these when we use odeint
def xode(x,t):
    xvel = x[1]
    return np.array([xvel,drag*xvel**2])

def yode(y,t):
    yvel = y[1]
    return np.array([yvel,-g+(drag*yvel**2)])

def dprojectile(v=30,angle=np.pi/4,h=0,graph=1):
   #x/y components of velocity and initial conditions
    x = 0
    y = h
    vx = v*np.cos(angle)
    vy = v*np.sin(angle)
    xic = np.array([x,vx])
    yic = np.array([y,vy])
    
   #times
    tf = (vy+np.sqrt(vy**2+2*g*h))/g
    tsteps = np.linspace(0,tf,1000)
    
   #solving odes
    x = odeint(xode,xic,tsteps)
    y = odeint(yode,yic,tsteps)
    
   #x and y positions 
    xpos = x[:,0]
    ypos = y[:,0]
    
   #outputs 
    hmax = np.amax(ypos)
    r = xpos[len(ypos)-1]
    tf = tsteps[len(ypos)-1]
    
   #creating the graph 
    if graph:
        plt.plot(x[:,0],y[:,0])
        plt.xlim(0,r*1.1)
        plt.ylim(0,hmax*1.1)
        plt.xlabel('x position (m)')
        plt.ylabel('y position (m)')
        plt.title('Projectile Motion with Drag')
        plt.show
    return hmax, r, tf