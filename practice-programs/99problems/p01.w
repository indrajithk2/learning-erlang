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

\title{01-- Find the last element of a list}
\date{25-Aug-2016}
\author{Indirajith K}

\begin{document}

\section{Problem}
Find the last element of a list

\section{Thoughts}
I feel there could be few ways to solve 
the problem. If we are able to reverse
the list then the first element will be the
one. The question is then to extract the 
first element. The other option might be to 
traverse the list to the end, and get the 
last element. But how do we know that a given
element is the last one. Another approach might
to determine the size of the list and element
at the location -- size. That will be last
element. The next few problems are on similar
lines. I think, I need a way to extract 
k$^th$ element of a given list, and that could
be helpful this family of problems. 

An idea to implement the above idea might
be to have a function that will essentially 
take two parameters. The first one is the 
list and the second parameter will be the 
location of the element that needs to be
extracted. After that, there could be a 
list traversal function that can be written, 
which in its each traversal increments a 
variable. Once the variable hits location
the element can be returned. Guards should 
be there so the iteration doesn't exceeds
the size of the list. 

Let me now write a small function that 
will traverse a list, and also increment a 
parameter.


To write a function that just computes the 
size of a list can be like this.

\begin{verbatim}
 len_of_list([H|T]) -> 1 + len_of_list(T);
 len_of_list([]) -> 0.
\end{verbatim}

But in this case, our requirement is differnt.

\section{Experiment }
I am going to do an experinment in which 
two variables are going to be bound with 
values, and trying to return them. 

@d More than one binding
@{
mul_bind() ->
    V1 = 10,
    V2 = 20.
@}

@o ex1.erl
@{
-module(ex1)
-export([mul_bind/0]).
@<More than one binding@>
@}

\section{Program}

@o p04.erl
@{
-module(p04).
-export([element_at_pos/2]).

traverse_list([H|_], E, _, I) when I =:= E ->
    {H,I};
traverse_list([H|T],E,_,I)-> traverse_list(T,E,H,I+1); 
traverse_list([],_,H,I)->{H,I}.

element_at_pos(L,E)->traverse_list(L,E,0,0).
@}

The solution above is not exactly what is 
in the problem. But it is a generalized
solution to extract element from a given 
position.

@o p01.erl
@{
-module(p01).
-export(last_element/1).

traverse_list([H|T],H)->traverse_list(T,H);
traverse_list([],H)->{H}.

last_element(L) -> traverse_list(L,0).

@}




\end{document}
