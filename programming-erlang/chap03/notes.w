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
For time being, I am skipping this section. I will write it later. 
Let me finish the current chapter, it is taking a while now.

\section{BIF}
BIF is Built in Function. BIF might be implemented in Erlang or directly 
on Erlang VM. The reason for BIF is that, it is otherwise not easy or
feasible to implement in Erlang. Examples of BIF are list\_to\_tuple/1 or 
time/0. All the functions in BIF behaves in such a way that it is 
implemented in the Erlang module. 

\section{Guards}
Guards increses the power of pattern matching as shown in the example below.

\begin{verbatim}
max(X,Y) -> when X > Y -> X;
max(X,Y) -> Y.
\end{verbatim}

It is easy to understand, only the syntax has to be noted. The first line
says, X is larger when X \textgreater Y, and if that doesn't gets satisfied Y is anyway
returned.

Guards can be used in heads of function definition where they are introduced 
with the \texttt{when} keyword. This is shown in the example above. It can be 
used in expressions as well. When used in expression, it evaluates to either true or
false. 

\section{Guard Sequences}

When guards are seperated by semicolons, it is called guard sequance. It evaluates
to \texttt{true} if any one of them evaluates to true. A guard is a series of guard
expressions seperated by commas. A guard is true only if all the guard expressions 
evaluates to true. Note the difference between Guard Sequence and Guard.

Guard expressions is a subset of all valid Erlang expressions. This is inorder to be
side effects free. Guards are extensions of pattern matching. One of the limitation of
guard is that, it cannot have user defined functions. Valid guard expression will be 
dealt later. Lets look at some examples now.

\section{Guard Examples}

Below is a farly complex usage of guard as a function head. 

\begin{verbatim}
f(X) when is_integer(X), X > Y, Y < 6 -> ...
\end{verbatim}

The meaning is When X is an integer and X is greater than Y and Y is less than 6. Here
note that, the comma means and.

\begin{verbatim}
is_tuple(T), tuple_size(T) =:= 6, abs(element(3,T)) > 5
\end{verbatim}

The above line has three conditions. T is a tuple and tuple size is 6 and 3 element of tuple T is 5.

\begin{verbatim}
is_integer(X), X > Y ; abs(Y) < 23
\end{verbatim}

Note the semicolon here. Semicolon indicates \texttt{or}. In the above line
it means either X is integer or absolute value of Y is less than 23. There are
additional operators for edge cases I think. There is a \texttt{andalso} and 
\texttt{orelse}. They differ from regular \texttt{and} and \texttt{or}.

I am currently getting a better clarity of the meaning of ``functional''. 
I think, it was well clear from the starting, I was not experiencing it.
The program is of the form as we write in mathematics $f(X)=Y$ subject to 
some conditions, and that is exactly that is being done here also. 


\section{\texttt{case} and \texttt{if} Expressions}

Take the example of filter here.

\begin{verbatim}
filter(P,[H|T]) ->
    case P(H) of 
        true -> [H|filter(P,T)];
        false -> filter(P,T);

    end;
filter(P,[]) -> [].
\end{verbatim}

The above is a good demonstration of \texttt{case}

Two cases for \texttt{true} and \texttt{false} is defined here. In the case
of \texttt{true} the new list is created and in the case of the \texttt{false}
the function is called once again. When the list is empty the case is defined
in the last line. 

\section{Accumulators}

Functional programming requires different thinking. One thing to note is that
when the list is traversed the variables are treated as new and not as over
written. This is same as in imperative languages also, but I never felt the
need to know that. Now, lets see the following example. 

This example seperates odd and even numbers in one traversal. This is 
a use case of  \texttt{case if}

\begin{verbatim}
odd_and_even_acc([H|T], Odd, Even) ->
    case  (H rem 2) of
        1 -> odd_and_even_acc(T,[H|Odd], Even);
        0 -> odd_and_even_acc(T, Odd, [H|Even])
    end;
odd_and_even([],Odd,Even) -> {Odd,Even}.
\end{verbatim}

This code is farily easy to understand.  We first split the list 
into \texttt{H} and \texttt{T}

Now we do the check with \texttt{H rem 2}. Both the cases are then 
handled. This way, it is iterated only once. 





\end{document}
