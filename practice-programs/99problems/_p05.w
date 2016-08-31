\section{Reverse a list}

If I have a list, I can reverse it, 
if I can extract the head (or otherwise) the
first element of the list, and then push that
into another list. The next head element of 
what is remaining can be extracted and then
added as the first element of the new list. If
I can recursively do that, a list reversal is 
possible. The recursion exit condition is when 
the list becomes empty.    

In Erlang, it is possible to extract the first
element of a list by $[H|T]$. Now what I don't 
recall is how to append an item to the front of
a list.

After going through the book again, it is fairly
easy to append an item infront of the list.
The expression $[A,B|L]$ appends A and B to the
front of the list. So in principle, all that is 
required is available. I can extract the head 
element, and then put that in a list. Then again, 
additional elements can also be extracted and 
can be put at the front. So, it should be possible
to reverse the list. But what I am not getting an
idea is that, how to properly organize all. 


I never thought, this exercise would twist my mind
so much. Probably, I got into a wrong track, and
went quite ahead with out knowing, or I was not
clear about the concepts. 

After I started with my initial approach, I thought
I could do this with list comprehension. But, I can 
now say that, my knowledge of list compresehension was
not that good. Probably since I didn't use it for
few days --- I forgot the actual working of it. 

I thought list comprehension differently, or I didn't
knew it. It is good that, I did this program so that
my understanding about list comprehension became 
better. Even though the book talks about it well, I 
didn't really comprehend it properly. 

List comprehension has the following format.
\begin{verbatim}
[F(X)||X<-L]
\end{verbatim}
This is right away copied from the book. F(X) is the
function acting on X, and the X is an element of L. What
is important to note is that, the elements of the list
L is processed from left to right and the list is also 
created in the same order\footnote{Documnetation says a reversal
of list is done as last step in list comprehension}.
So, it cannot naturaly reverse
the list. One of the attempts I tried was

\begin{verbatim}
[X||X<-L].
\end{verbatim}

I was thinking that the elements are added in the front, which
ofcourse was wrong.

\subsection{Using new list} 
I came to this decision after some thought process. I thought,
if I cannot naturally reverse the list with a list comprehension, 
then I have to use a different list for the purpose. Then, I found
that initialization of that list to an empty list was difficult. 
This is a pattern I think, should be always kept in mind while
writing Erlang programs.     

%% TODO: Put the following text in box 
If a variable is required to be used as an accumulator, then, 
there should be an innerfunction that can be used to store the 
reversed list. 

Here is the intial version I came up with.
\begin{verbatim}
@i _rev.erl.01
\end{verbatim}
It is not quite nice, and abuse of case statement. But, that 
helped me to structure my thoughts. Then I came up with a 
simpler version as mentioned below.
\begin{verbatim}
@i _rev.erl.02
\end{verbatim}

\section{Retrospection}
Looking back, I am surprised why it took so much effort to write
the program. To me it seems, it was a different paradigm of 
programming, which I am still not very used to. Also, being a 
new language, I am not that comfortable with various constructs.
Also, I have doubt whether it can be done or not. The usage of
conditionals for example, is not clear. Again, the usage of the
second list to store the new reversed list was not known to me, or
rather, it didn't strike me well. Also, an initial version of the 
program I wrote was wrong from two aspects. I used a function 
definion inside and a bad list construction. The code some what looks
like below.

\subsection{Improved version of code}
\begin{verbatim}
@i _rev.erl.03
\end{verbatim}


