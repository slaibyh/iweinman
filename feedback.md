## Jan 20
`satellite.m` looks good, has comments, and produces the right results (50% of the time that is). I would take another look at what happens in line 13 - there is something that happens in line 11 that makes line 13 and the resulting calculation problematic, do you see it? Also, I do expect some comments about the questions in the problem statement to show up in the comments of the script.

## Jan 27
Problem 3 checks out.

## Feb 3
Problem 4/4a look excellent, short and concise. The only problem you have is storing or displaying your answers. When we get to functions, it's going to be imperative that you store results in a variable for later, but you do not. Especially in Problem 4, you display nothing because all statements are ended in `;`

## Feb 9
The climate program is running but there is something definitely wrong with your cumulative sum of carbon emissions. You need to dissect line 11 in that program. You are using an `&` in a function - do some testing to figure out what happens to the inputs when connected by this logical operator.

## Feb 18
I still see the same problems with the problem 4's that I specified above. Looking at the new satellite program that takes units, it works and splits the units correctly, however, I now see where the problem is with your velocity - take a look at line 40 and ask yourself what this is actually calculating and why this is actually much too slow a velocity. I think there's still some major issues with your projectile motion - I would double check your calculations on line 25/26 - there is an error - and then also think more about line 31-32, these expressions worked under some assumptions, but not in this new context of varying height.

## Feb 24
Problem 6 looks good. Projectile is still having some issues with projectile - you're over shooting the time by a lot. I would double check the time calculation - also, I would avoid using split to incorporate units into this program, I would just take units as a separate argument.

## Mar 9
You have a solid start on the projectile motion problem in python, but there are a few problems. 1) The program `projectile` works for the initial h of zero, but not for any other height. 2) You have a big problem with what your conversion programs are returning to `projectile` to use in the `sin` function on line 16 and 17 of that program. 3) and don't forget to use a jupyter notebook to call this function when you're done. 
## Mar 16
I think that you ironed out the issues in the projectile function, now you just need to use a jupyter notebook to call the function.
