#This program contains functions for projectile motion that take into account drag forces

from scipy.integrate import odeint
import numpy as np
import matplotlib.pyplot as plt

def dprojectile(v=30,angle=np.pi/4,h=0,g=9.81):
    #initial conditions and x/y components of velocity
    x = 0
    y = h
    vx = v*np.cos(angle)
    vy = v*np.sin(angle)
    
    #calculating outputs
    tf=(vy+m.sqrt(vy**2+2*g*h))/g
    
    return hmax, r, tf, plot