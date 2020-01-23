Problem \#4 *hip, hip, array* 
=======================

**NAME**:

Outcomes 
--------

-   Load data in MATLAB 

-   Use arrays and indexing to filter data

Problem 
-------
Instead of containing or representing one value, arrays can contain many values, often of different data types. Today, I want you to load data about the periodic table into MATLAB. You should then construct a script that uses indexing to sift through the data and answer various questions about it.

1.  `pull` the repository `CompProbSol`. There should be a number of updates the repository.

2.  Open the script `loadmat.m` in the problem 4 folder. Save this script and the files named `smallperiodictable.xx` to your personal repository set up the other day. This program will be the starting point for today's problem.

3.  `loadmat.m` contains code that will load the data from `smallperiodictable.mat` into MATLAB. Once `loadmat.m` is executed, MATLAB should have 7 columns containing the names, atomic weights, atomic numbers, symbols, densities, number of isotopes, and discovery year for the first 99 elements of the periodic table (the columns have titles in `smallperiodictable.csv`). 

4.  Use indexing **(no `if` or `for` loops)** to answer the questions below. Your program should answer these questions when run, **you should NOT be typing out the answers in comments at any point**.

5. Write a separate script that imports smallperiodictable.txt and smallperiodictable.csv into MATLAB. The exact method is up to you. Save this script for later. Call it `problem4a.m`.

Questions 
-------

1. How many elements are denser than water in their natural form? List all those elements

2. How many elements have over 100 isotopes? List those elements.

3. How many elements were discovered before 1900? List those elements.

4. Is there a clear relationship between atomic weight and density? Show me a `plot` to answer the question. *Wait, we haven't talked about `plot` or producing graphs of any kind. True, this is more looking ahead, you should read any documentation about plot you can find to help you.*
