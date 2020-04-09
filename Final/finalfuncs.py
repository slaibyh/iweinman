#Final project functions program
import numpy as np
import tkinter as tk
import matplotlib.pyplot as p
from PIL import ImageTk, Image

G = 6.67*10**(-11)#gravitational constant
M = 5.98*10**(24)#mass of Earth
R = 6.371*10**(6)#radius of Earth

#function for all unit conversions
def convert(x,unit,newunit):
    if unit == 'm' and newunit == 'km':
        out = x/1000
    elif unit == 'm' and newunit == 'mi':
        out = x/1609
    elif unit == 'm' and newunit == 'ft':  
        out = x*3.281
    elif unit == 'km' and newunit == 'm':
        out = x*1000
    elif unit == 'km' and newunit == 'mi':
        out = x/1.609
    elif unit == 'km' and newunit == 'ft':
        out = x*3281
    elif unit == 'mi' and newunit == 'm':
        out = x*1609
    elif unit == 'mi' and newunit == 'km':
        out = x*1.609
    elif unit == 'mi' and newunit == 'ft':
        out = x*5280
    elif unit == 'ft' and newunit == 'm':
        out = x/3.281
    elif unit == 'ft' and newunit == 'km':
        out = x/3281
    elif unit == 'ft' and newunit == 'mi':
        out = x/5280  
    elif unit == 'secs' and newunit == 'mins':
        out = x/60
    elif unit == 'secs' and newunit == 'hrs':
        out = x/3600   
    elif unit == 'secs' and newunit == 'days':
        out = x/86400
    elif unit == 'mins' and newunit == 'secs':
        out = x*60
    elif unit == 'mins' and newunit == 'hrs':
        out = x/60
    elif unit == 'mins' and newunit == 'days':
        out = x/1440
    elif unit == 'hrs' and newunit == 'secs':
        out = x/3600
    elif unit == 'hrs' and newunit == 'mins':
        out = x/60
    elif unit == 'hrs' and newunit == 'days':
        out = x/24
    elif unit == 'days' and newunit == 'secs':
        out = x*86400
    elif unit == 'days' and newunit == 'mins':
        out = x*1440
    elif unit == 'days' and newunit == 'hrs':
        out = x*24
    else:
        print('Please input proper units')
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
#r = a/1+e*np.cos(theta);
#def satorbit():
  #  ellipse = 
   # return ellipse

#function that creates a new window
def window():
    #creating the window and designing it
    win = tk.Tk()
    win.title("Satellites")
    win['bg'] = 'black'
    win.geometry('700x700')
    #Close button
    close = tk.Button(win, text="Close", command=win.quit)
    close.pack(side="bottom")
    #importing the Earth
    img = ImageTk.PhotoImage(Image.open("Earth.jpg"))
    Earth = tk.Label(image=img)
    Earth['bg'] = 'black'
    Earth.pack(side="bottom")
    #Left Drop-Down Box
    menul = tk.StringVar()
    options = ["Orbital Period","Orbital Velocity"]
    menul.set(options[0])
    dropl = tk.OptionMenu(win,menul,*options)
    dropl['bg'] = 'black'
    dropl.pack(side="left")
    #Right Drop-Down Box
    if dropl == options[0]:
        menur = tk.StringVar()
        perunits = ["Seconds","Minutes","Hours","Days"]
        menur.set(perunits[1])
        dropr = tk.OptionMenu(win,menur,*perunits)
        dropr.pack(side="right")
    else:
        menur = tk.StringVar()
        velunits = ["meter/second","meter/minute","meter/hour","meter/day","kilometers/second","kilometers/minute","kilometers/hour","kilometers/day","feet/second","feet/minute","feet/hour","feet/day","miles/second","miles/minutes","miles/hour","miles/day"]
        menur.set(velunits[5])
        dropr = tk.OptionMenu(win,menur,*velunits)
        dropr.pack(side="right")
    win.mainloop()
    return win