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
 
