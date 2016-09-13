-module(initvtx).
-export([un_vstd_vrtx/2,remove_dups/1]).

un_vstd_vrtx(Graph,StartVertex)->
    LstWithDups1 = [V1||[V1,V2,_]<-Graph, V1 =/= StartVertex, V2 =/= StartVertex],
    remove_dups(LstWithDups1).

remove_dups(L) -> 
    remove_dups(L,[]).

remove_dups([H|T],[])->
    remove_dups(T,[H]);    
    remove_dups([H|T],UL)->
        remove_dups([H|T],UL,elem_in_list(H,UL));
    remove_dups([],UL)->UL.

remove_dups([_|T],UL,true)->
    remove_dups(T,UL);
remove_dups([H|T],UL,false)->
remove_dups(T,[H|UL]);
remove_dups([],UL,_)->UL.


elem_in_list(E,[H|T])->
    if 
        H =:= E -> true;
        true -> elem_in_list(E,T)
    end;
elem_in_list(_,[])->false.


