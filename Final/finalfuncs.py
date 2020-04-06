#Final project program
import numpy as np
import tkinter as tk

G = 6.67*10**(-11)#gravitational constant
M = 5.98*10**(24)#mass of Earth
R = 6.371*10**(6)#radius of Earth

#function to converts T into seconds
def tconvert(T,str):
    if str == 'secs':
        T = T
    elif str == 'mins':
        T = T*60
    elif str == 'hours':
        T = T*3600
    elif str == 'days':
        T = T*86400
    return T

#function that converts seconds into minutes
def secs2mins(x):
    mins = x/60
    return mins

#function that converts between meters to kilometers
def distconvert(x,str):
    if str == 'm':
        out = x*1000
    if str == 'km':
        out = x/1000
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




