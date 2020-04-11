import tkinter as tk
from PIL import ImageTk, Image
import finalfuncs as ff

#creating the window and designing it
win = tk.Tk()
Height = 700
Width = 700
canvas = tk.Canvas(win,width=Width,height=Height,highlightbackground='black')
canvas['bg'] = 'black'
win.title('Satellites')
canvas.pack()

#importing the Earth
img = ImageTk.PhotoImage(Image.open("Earth.jpg"))
Earth = tk.Label(image=img)
Earth['bg'] = 'black'
Earth.place(x=200,y=240)

#Name text box label
namelabel = tk.Label(win,text="Name of Satellite:")
namelabel['bg'] = 'black'
namelabel['fg'] = 'white'
namelabel.place(x=132,y=42)

#Name text box
namebox = tk.Entry(win,width=20,highlightbackground='black')
namebox.place(x=255,y=40)

#Value text box
valuebox = tk.Entry(win,width=20,highlightbackground='black')
valuebox.place(x=255,y=80)

#Right Drop down menu
def dropr(event):
    perunits = ["Seconds","Minutes","Hours","Days"]
    velunits = ["meter/second","meter/minute","meter/hour","meter/day","kilometers/second","kilometers/minute","kilometers/hour","kilometers/day","feet/second","feet/minute","feet/hour","feet/day","miles/second","miles/minutes","miles/hour","miles/day"]
    menur = tk.StringVar()
    if menul.get() == 'Orbital Period':
        menur.set(perunits[1])
        dropr = tk.OptionMenu(win,menur,*perunits)
        dropr['bg'] = 'black'
        dropr.place(x=450,y=80)
    if menul.get() == 'Orbital Velocity':
        menur.set(velunits[5])
        dropr = tk.OptionMenu(win,menur,*velunits)
        dropr['bg'] = 'black'
        dropr.place(x=450,y=80)

#Left drop down menu
options = ['Orbital Period','Orbital Velocity']
menul = tk.StringVar()
dropl = tk.OptionMenu(win,menul,*options,command=dropr)
dropl.place(x=130,y=80)
dropl['bg'] = 'black'

#Label for left drop down menu
droplabel = tk.Label(win,text='Please Choose:')
droplabel['bg'] = 'black'
droplabel['fg'] = 'white'
droplabel.place(x=20,y=80)

#Animating the satellite
def orbit():
    Sat = canvas.create_oval(500,220,520,240,fill='white')
    


#Button that runs function 'orbit'
addsat = tk.Button(win,text='Add Satellite',highlightbackground='black',command=orbit)
addsat.place(x=300,y=115)
win.mainloop()