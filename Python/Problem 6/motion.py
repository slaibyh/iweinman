# -*- coding: utf-8 -*-
"""
Starting point for Problem 6a
"""
#Import necessary packages
import numpy as np
import math as m
import matplotlib.pyplot as p

def projectile(v=15,ang=30,h=0,g=9.8):
    
    #convert the default angle (in degrees) to radians
    rada=aconversion(ang,"degrees")
    
    #assign variables for components of velocity
    vx=v*np.cos(rada)
    vy=v*np.sin(rada)
        
    #calculate outputs
    r=vx*(vy+m.sqrt(vy**2+2*g*h))/g
    tf=(vy+m.sqrt(vy**2+2*g*h))/g
    hmax=h+((vy**2)/(2*g))
    
    #plot the trajectory of the projectile
    t=np.arange(0,tf,0.01)
    d=(vx*t)
    he=h+(vy*t-(.5*g*t**2))
    graph(d,he)
    
    return r,tf,hmax  

    #Function for graphing the trajectory of the projectile
def graph(x,y):
    p.plot(x,y)
    p.xlabel('Distance (meters)')
    p.ylabel('Height (meters)')
    p.title('Height vs. Dsitance')
    p.show()
    return


def freefall(h=100,v=0,g=9.81):
    
    tf=m.sqrt((2*h)/g)
    vf=v-g*tf
    
    return vf,tf

#Function for converting between feet and meters (conversion factor taken from Google)
def dconversion(distance,unit):
    if unit=="ft" or unit=="feet":
        d=distance/3.281
        units="m"
    elif unit=="m" or unit=="meters":
        d=distance*3.281
        units="ft"
    else:
        print('Please input a number for distance with proper units')       
    return d,units


#Function for converting between m/s, ft/s, mph (all conversion factors taken from Google)
def vconversion(velocity,unit,newunit):
    if newunit=="m/s":
        if unit=="ft/s":
            newv=velocity/3.281
        elif unit=="mph":
            newv=velocity/2.237
        else:
            print('Please input a velocity with units and a new unit to convert to')
          
    elif newunit=="ft/s":
        if unit=="m/s":
            newv=velocity*3.281
        elif unit=="mph":
            newv=velocity*1.467
        else:
            print('Please input a velocity with units and a new unit to convert to')
      
    elif newunit=="mph":
        if unit=="m/s":
            newv=velocity*2.237
        elif unit=="ft/s":
            newv=velocity/1.467
        else:
            print('Please input a velocity with units and a new unit to convert to')
    else:
        print('Please input a velocity with units and a new unit to convert to')
    return newv,newunit

#function for converting between degrees and radians
def aconversion(angle,unit):
    if unit=="degrees":
        a=m.radians(angle)
    elif unit=="radians":
        a=m.degrees(angle)
    else:
        print('Please input an angle with proper units')
    return a