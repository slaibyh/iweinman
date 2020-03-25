# -*- coding: utf-8 -*-
Gettysburg = "Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we can not dedicate -- we can not consecrate -- we can not hallow -- this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."
codex = { "a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8, "i": 9, "j": 10,"k": 11,"l": 12,"m": 13,"n": 14,"o": 15,"p": 16,"q": 17,"r": 18,"s": 19,"t": 20,"u": 21,"v": 22,"w": 23,"x": 24,"y": 25, "z": 26, " ": 0, ",":-1, ".":-2, "-": -3}

#convert to all lowercase
gettysburg=Gettysburg.lower()

#convert the speech into numbers according to codex
encodedspeech = []
s = range(0,len(gettysburg))

#function for converting into numbers
def encode(string):
    for i in s:
        encodedspeech.append(codex[gettysburg[i]])
    return encodedspeech 

#convert the speech back into words
#Thank you https://www.youtube.com/watch?v=daefaLgNkw0 for the help

def decode(numbers,codex):
    d_backwards = {}
    for key, value in codex.items(): 
        d_backwards[value] = key
    los = [d_backwards[num] for num in numbers]
    decodedspeech = ''.join(los)
    return decodedspeech

import numpy as np
hint = np.load('hint.npy')
hintlist = hint.tolist()
hlist = [i for i in hintlist]
hl = [x-7 for x in hlist]

hint = (decode(hl,codex))

