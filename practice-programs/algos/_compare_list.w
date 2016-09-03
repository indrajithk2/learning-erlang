\section{\Problem}
Suppose we have two lists as below.

\begin{verbatim}
L1 = [a,b,c].
L2 = [[a,20],[b,30],[c,25],[d,45],[e,25]].
\end{verbatim}

Find the element in L2 which has any element of L1 
and also has the least score. Score is the number 
which appears as the second element of the sublist
of L2.

To check all the elements of L2 which has elements
contained in L1.

A small diversion here. How to calculate the largest
number in a list of numbers.

@d Largest Number In a List
@{
largest_num(L)->largest_num_impl(L,0).
largest_num_impl([H|T],A)->
        H > A -> largest_num_impl(T,H);
        A > H -> largest_num_impl(T,A);
largest_num_impl([],A)->A.
@}
