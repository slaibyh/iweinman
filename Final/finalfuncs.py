#Final project functions program
import numpy as np
import tkinter as tk

G = 6.67*10**(-11)#gravitational constant
M = 5.98*10**(24)#mass of Earth
R = 6.371*10**(6)#radius of Earth

#function for all unit conversions
def distconvert(x,unit,newunit):
    if unit == 'm' and newunit == 'km':
        out = x/1000
    if unit == 'm' and newunit == 'mi':
        out = x/1609
    if unit == 'm' and newunit == 'ft':  
        out = x*3.281
    if unit == 'km' and newunit == 'm':
        out = x*1000
    if unit == 'km' and newunit == 'mi':
        out = x/1.609
    if unit == 'km' and newunit == 'ft':
        out = x*3281
    if unit == 'mi' and newunit == 'm':
        out = x*1609
    if unit == 'mi' and newunit == 'km':
        out = x*1.609
    if unit == 'mi' and newunit == 'ft':
        out = x*5280
    if unit == 'ft' and newunit == 'm':
        out = x/3.281
    if unit == 'ft' and newunit == 'km':
        out = x/3281
    if unit == 'ft' and newunit == 'mi':
        out = x/5280  
    if unit == 'secs' and newunit == 'mins':
        out = x/60
    if unit == 'secs' and newunit == 'hrs':
        out = x/3600   
    if unit == 'secs' and newunit == 'days':
        out = x/86400
    if unit == 'mins' and newunit == 'secs':
        out = x*60
    if unit == 'mins' and newunit == 'hrs':
        out = x/60
    if unit == 'mins' and newunit == 'days':
        out = x/1440
    if unit == 'hrs' and newunit == 'secs':
        out = x/3600
    if unit == 'hrs' and newunit == 'mins':
        out = x/60
    if unit == 'hrs' and newunit == 'days':
        out = x/24
    if unit == 'days' and newunit == 'secs':
        out = x*86400
    if unit == 'days' and newunit == 'mins':
        out = x*1440
    if unit == 'days' and newunit == 'hrs':
        out = x*24    
    return out

#function for orbital radius
def orbitalr(T):
    r = (((T**2)*G*M)/(4*np.pi**2))**1/3
    oradius = r+R
    return oradius

#function for orbital velocity
def orbitalv(T):
    ovelocity = (G*M/orbitalr(T))**1/2
    return ovelocity

#function that makes a dotted ellipse of the sattelite's orbit
#def satorbit(T):

   # return ellipse

#function that creates a new window
def window():
    win = tk.Tk()
    win.title("Satellites")
    win['bg'] = 'black'
    win.geometry('700x700')
    win.mainloop()
    return win