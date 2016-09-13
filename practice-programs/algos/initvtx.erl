-module(initvtx).
-export([un_vstd_vrtx/2,remove_dups/1]).

un_vstd_vrtx(Graph,StartVertex)->
    LstWithDups1 = [V1||[V1,V2,_]<-Graph, V1 =/= StartVertex, V2 =/= StartVertex],
    remove_dups(LstWithDups1).

remove_dups(L) -> 
    remove_dups(L,[]).

remove_dups([H|T],UL)->
    if 
        UL =:= [] -> remove_dups(T,[H]);
        true ->
                ST = elem_in_list(H,UL),
            if 
                ST =:= true
                        -> remove_dups(T,UL);
                true -> remove_dups(T,[H|UL])
            end
    end;
remove_dups([],L)->L.

elem_in_list(E,[H|T])->
    if 
        H =:= E -> true;
        true -> elem_in_list(E,T)
    end;
elem_in_list(_,[])->false.


