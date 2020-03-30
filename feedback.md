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

## Mar 23
I looked over proble 7a and it seems that you are getting correct answers. One thing that you should do, though, is include `show()` statement in your graph function, in jupyter notebooks, you get a graph, but in spyder you do not, including a show() makes sure that it appears in both. I took a quick look through your `ptable` function, and while it runs and seems to calculate values correct, You still have a problem with the binding energy graph looks like two graphs, but I don't know what the second line is. Also, you have no output arguments assigned, you output the mass, BUT it is only printed to the command window and is not stored as an output argument.

## Mar 26
I went back to motion.py and when I ran projectile() a graph did show up in the command window. When I added a p.show() to my graph function both a regular graph and an empty one display in the command window. For ptable I fixed the binding energy graph and I did assign some output arguments. I had to assign both outputs to one argument, though. For example in line 61 of ptable.m varargout{1} is equal to the mass and the row of the element that was input. I had to do this because if I had varargout{1} as the mass and varargout{2} as the row, the function would only output varargout{1}. 

## Mar 29
Problem 7a is pretty much done. I could not figure out how to display the years without their indecies in questions 1 and 2. I looked into removing the index entirely from the dataframes as well as removing the index in the function so it is not output with the years, but to no avail. Should the output be just the years or is it okay if their indecies are there? Also, I am completely stumped by the overlap part of the problem. 
## Mar 30
I reviewed the encoding problem, it looks good EXCEPT I would be more conscious about what is in the function's scope and what is not in the function's scope -  for instance, you refer to a string `s` on line 10 of encoded.py, and then refer to this `s` variable in the function encode. This works IF you have just run the entire file, but if this function is taken out of context - then the function would not run because `s` is not in the scope of `encode`, you got away with it because of the set up in spyder - not because it was w well-written program. For the last part in 7a - I would get rid of your graph, graphing years versus years is a very uninformative visual, I would instead look at a function similar to intersect - finding the common values among the years groups, did a hot year and high carbon year occur simultaneously? Well, are there common years among the two lists. You won't get that from a graph. (oh, and don't worry about the index displaying along with the value, this is default behavior when using dataframes) Have you taken another look at ptable, I think you still have a problem with assigning output values.

My output values in ptable are assigned on lines 44,64,90, and 111. I have both outputs values assigned to `varargout{1}` in each case. When I assigned `figure(1)` to `varargout{1}` and `figure(2)` to `varargout{2}`, only `figure(1)` would be output to the workspace. And the same was true for the other three cases, only `varargout{1}` would be output to the workspace. Having both output values assigned to `varargout{1}` is the only method I could figure out that ensures both outputs are put into the command window. 
