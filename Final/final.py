#Final project program
import numpy as np
import turtle as t
import matplotlib.pyplot as p

G = 6.67*10**(-11)#gravitational constant
M = 5.98*10**(24)#mass of Earth
R = 6.371*10**(6)#radius of Earth

#function to convert T into seconds
def tconvert(T,str):
    if str == 'seconds':
        T = T
    elif str == 'minutes':
        T = T*60
    elif str == 'hours':
        T = T*3600
    elif str == 'days':
        T = T*86400
    return T

#function for orbital radius
def orbitalr(T):
    r = (((T**2)*G*M)/(4*np.pi**2))**1/3
    oradius = r+R
    return oradius

#function for orbital velocity
def orbitalv(T):
    ovelocity = (G*M/orbitalr(T))**1/2
    return ovelocity

#function that makes a circle of the sattelite's orbit
def circle(T):
    t.Screen()
    t.bgcolor("black")
    t.color("white")
    r = orbitalr(T)#this radius is way too big it would probably take years for turtles to finish drawing this cirle
    orbit = t.circle(r)
    return orbit




