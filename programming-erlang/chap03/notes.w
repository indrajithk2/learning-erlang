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

\title{Literate Programming Template}
\date{22-Aug-2016}
\author{Indrajith K}

\begin{document}

\section{List Comprehensions}

List comprehensions are expressions with out having to 
use funs, maps or filters.

Doubling elements of a list usual way.

\begin{verbatim}
lists:map(fun(X)->2*X end,L).
\end{verbatim}

This is much simpler if we use list comprehension.

\begin{verbatim}
[2*X|| X <- L].
\end{verbatim}

Here the interesting point is how the elements of L is mapped to X. 


Lets now take the case of shopping list. 
We create a shopping list called Buy.

\begin{verbatim}
Buy = [{oranges,4},{newspaper,1},{apples,10},{pears,6},{milk,3}].
\end{verbatim}

The list elements are tuples, which tells the item and the quantity to buy.
Now suppose we have to double the each item, we can do as follows.

\begin{verbatim}
[{Name,2*Number}||{Name,Number}<-Buy].
\end{verbatim}

Now it is interesting how I write a list comprehension. I knew it is going to be
a list. So, create a []. Then I know there is a \textbar \textbar operator that separates the
expression and the list. I can now write the pattern matching in the right and the 
expression in the left and I am done!

Here is the shop module. (I am shifting to 2nd Edition of the Book here, mainly 
due to exercises available).

\begin{verbatim}
-module(shop).
-export([cost/1]).

cost(oranges)->5;
cost(newspaper)->8;
cost(apples)->2;
cost(pears)->9;
cost(milk)->7.

\end{verbatim}

Note that, we are exporting cost function here. It takes one argument, which
is an atom corresponding to the fruit name, returns the cost. I am not sure, if
it is correct to say ``returns''. Probably these cost are little European prices! Milk 
costs less than news paper. 

Lets summarize what we have. We have a module named shop which has prices of items,
and a list of items stored in a list called Buy. Now we have to compute the 
total price of the items in the list. For computing the cost of each item, we have
to extract the quantity from the Buy list and multiply that with the cost mentioned
in the shop module.

Here is my attepmpt with out looking at the book.
My thought process is something like, first extract name and quantiy from the Buy list.
Then pass the name to the shop:cost() and get the cost of item and multiply. Will think
about totaling later. We might be able to do the totalling via Tail and Head using \textbar
operator.


\begin{verbatim}
Costs -> [shop:cost(Name)*Number||{Name,Number}<-Buy].
\end{verbatim}

Now that we have the list of costs of each item, we can total it.

\begin{verbatim}
Total([])->0;
Total(H|T)->H+Total(T).
\end{verbatim}

Now let me see what the book has to say.

Ok; it uses lists:sum().

\section{Quicksort}
This is bit complex to understand. Before to that we need to understand 
how the quick sort works. Quick sort is recursive in nature. It is about
selecting a pivot first, and then partitioning elements that are smaller
and bigger to the pivot into two separate lists. This process is continued 
for each partition until nothing is left. Now let us see how this is done
in Erlang. 

\begin{verbatim}    
qsort([])->[];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).
\end{verbatim}    

I feel that, the book, don't show all the steps. 

Now the program can be explained as follows. The first element is taken
as the pivot. We then proceed to create two lists which are less than
the pivot and which are greater than the pivot. The pivot is added to the 
middle. This is called recursievely. What I find interesting is the list
comprehension. X \textless -  T, X \textless Pivot is elegant. 


\section{Pythagorean Triplets}
As mentioned Pythagorean Triplets are \{A,B,C\} such that $A^2+B^2=C^2$

The code is as follows.

\begin{verbatim}
pythag(N) ->
    [ {A,B,C} ||
        A <- lists.seq(1,N),
        B <- lists.seq(1,N),
        C <- lists.seq(1,N),
        A + B + C =< N,
        A*A + B*B =:= C*C
    ].
\end{verbatim}

This is an interesting example. There are three lists here and two conditions. Each list 
is iterated for all combinations. For example it will start with A = 1, and then B is 
set to 1 and C is iterated from 1 to N. B can then be incremented to 2 and then again 
C is iterated from 1 to N. At each iteration, the conditions are checked. I feel the 
equivalent imperative program will be like

\begin{verbatim}
for(i = 1, i<= N, i++)
{
    for (j = 1, j<= N, j++)
    {
        for(k =1, k<= N, k++)
            {
                if (i*i + j*j = k*k && i + j + k <= N)
                {
                    printf("i=%d, j=%d, k=%d\n",i,j,k);
                }
            }
    }
}
\end{verbatim}


\section{Anagrams}

\end{document}
