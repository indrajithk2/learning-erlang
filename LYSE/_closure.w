\section{Closure}
It took me some time, to get an idea of closure.
Even then, I am not sure, I am in a position to 
use it . I am not clear when to use it. My 
understanding of it, is that it is very similar
to the object oriented concept of objects. Since
Since Erlang don't have classes, closures are things
that comes close to it.

Take the example below. 

\begin{verbatim}
PrepareAlarm -> fun(Room)  -> 
    io:format("Alarm set in ~s! Call Batman!~s ~n",)[Room],
    fun() ->
    io:stream("Alarm tripped in ~s! Call Batman ~n",[Room])
    end
end.
\end{verbatim}

Now we execute that here.

\begin{verbatim}
AlarmReady = PrepareAlarm("bathroom").
AlarmReady().
\end{verbatim}


Under the hoods, this is what happens.
When it is called the first time, the function 
is called with ``bathroom'' fun(Room) is called. Then
something happens that fun() is returned 


\section{An experiment}
Let me try an example for a closure. This closure
behaves almost like a class in an object oriented language.


The idea is to create a function called Fruit, and it will 
have some properties like color, taste, and season. These
attributes can be intialized during the first call. Then
the closure takes a pattern, and matches against the 
supplied one, and executes the right function.


@d Fruit -- Outer function
@{
fruit(Color, Taste, Season) ->
    FruitColor = Color,
    FruitTaste = Taste,
    FruitSeason = Season,
    fun(Method) ->
        case Method of
            color -> FruitColor;
            taste -> FruitTaste;
            season -> FruitSeason
        end
end.
@}


\section{Complete Program}

@o closure01.erl
@{
-module(closure01).
-export([fruit/3]).
@<Fruit -- Outer function@>
@}



\section{Running the program}

Below is the output of the program. Here, we have
created equivalent of objects using closure. We have
created objects Apple, and Grapes. They behave like 
objects. 

\begin{verbatim}
> erl
Eshell V8.0  (abort with ^G)
1> c(closure01).
closure01.beam: Module name 'closureex1' does not match file name 'closure01'
error
2> c(closure01).
{ok,closure01}
3> Apple = fruit(red,sweet,allyear).
** exception error: undefined shell command fruit/3
4> Apple = closure01:fruit(red,sweet,allyear).
#Fun<closure01.0.90817589>
5> Apple(color).
red
6> Apple(taste).
sweet
7> Grape = closure01:fruit(purple,bitter,summer).
#Fun<closure01.0.90817589>
8> Grape(taste).
bitter
9> Grape(color).
purple
10> 
\end{verbatim}


