# -*- coding: utf-8 -*-
"""
Starting point for Problem 6a
"""
#Import necessary packages
import numpy as np
#import matplotlib as mpl
import math as m

def projectile(v=15,ang=30,h=0,g=9.81):
    
    #convert the default angle (in degrees) to radians
    rada=aconversion(ang,'degrees')
        
    #calculate all the outputs. Formulas taken from https://courses.lumenlearning.com/boundless-physics/chapter/projectile-motion/
    r=v**2*np.sin(2*rada)/g
    tf=2*v*np.sin(rada)/g
    hmax=h+(v**2*(np.sin(rada)**2))/(2*g)
    return r,tf,hmax  


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

#Function for graphing the trajectory of the projectile
#def graph()
 #   plot()
  #  return

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
        units="radians"
    elif unit=="radians":
        a=m.degrees(angle)
        units="degrees"
    else:
        print('Please input an angle with proper units')
    return a,units