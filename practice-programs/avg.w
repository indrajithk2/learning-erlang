\documentclass[12pt, a4paper]{book}
\newif\ifshowcode
\showcodetrue

\usepackage{latexsym}

\usepackage{listings}

\usepackage{color}
\definecolor{linkcolor}{rgb}{0, 0, 0.7}

\usepackage{xcolor}
\newcommand\mytodo[1]{\textcolor{red}{#1}}

\usepackage[%
backref,%
raiselinks,%
pdfhighlight=/O,%
pagebackref,%
hyperfigures,%
breaklinks,%
colorlinks,%
pdfpagemode=None,%
pdfstartview=FitBH,%
linkcolor={linkcolor},%
anchorcolor={linkcolor},%
citecolor={linkcolor},%
filecolor={linkcolor},%
menucolor={linkcolor},%
pagecolor={linkcolor},%
urlcolor={linkcolor}%
]{hyperref}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\textheight}{8.9in}
\setlength{\textwidth}{6.5in}
\setlength{\marginparwidth}{0.5in}

\title{An Erlang Program to evaluate Avg}
\date{24$^{th}$, August 2016}
\author{Indirajith K}

\begin{document}

\maketitle
\section{Average of a list of numbers}
This should be an easy program to write. 
To compute average we require the number
of elements in the list and then we have
to add all the numbers in the list, and 
finally divide the total with the number
of elements. 

\section{Approach - 1 -- Traversing twice}
I intend not use the size operator that comes
with the lists module. To compute the size 
of the list, it has to be traversed once. 
Then to compute the sum of all the numbers
in the list, it has to be again traversed.
I have to see in the second approach if 
both can be accomplished in single shot.


The module name will be avg, and the method
it will export will be called mean.
 
@d Define the module and export the function
@{
-module(avg).
-export([mean/1]).
@}


@d Size of List
@{
listsize([_|T]) -> 1 + listsize(T);
listsize([]) ->0.
@}

@o avg.erl
@{
@<Define the module and export the function@>
@<Size of List@>
@<Sum of numbers@>
@<Mean of numbers@>
@}


Let me test the program now. While testing, I found 
out that we have to consider a case if the list is 
empty. Otherwise we will end up dividing by zero. 

Let us now attempt to write the sum of the numbers
in the list. 

@d Sum of numbers
@{
total([H|T]) -> H + total(T);
total([]) ->0.
@}

We still haven't taken case with the list is empty. This
has to be taken care. 

Let us now proceed to compute the mean.

@d Mean of numbers
@{
mean(L) ->
    case (listsize(L)) of
        0 -> 0;
        X when X > 0 -> total(L)/listsize(L)
    end.
@}

I feel that empty list can be taken care here. Anyway, 
lets run this for now. 


I had some problem writing the function using 
    {\tt case}. Finally I read LYSE to clarify
    it. Some interesting misunderstanding I had
    is case cannot use a custom function. Here, I 
    am using {\tt listsize(L)}.  

I feel that LYSE is a great book, which explains
the intricacies. I should read it. I just understood
what a guard really is. What ever is there to the 
right of when is a guard. 

The chapter on Pattern Matching from LYSE is great.
It clearly talks about guard, if, and case of. This
could be a great reference.



\end{document}
