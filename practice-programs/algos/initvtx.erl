-module(initvtx).
-export([un_vstd_vrtx/2,remove_dups/1]).

un_vstd_vrtx(Graph,StartVertex)->
        un_vstd_vrtx(Graph,StartVertex,[]).

un_vstd_vrtx([],_,[])->[];
un_vstd_vrtx([H|T],StartVertex,Acc)->
    [V1,V2,_] = H,
    un_vstd_vrtx(T,StartVertex,[V1,V2|Acc]);
un_vstd_vrtx([],StartVertex,Acc)->
    StartVertexRemoved = [V||V<-Acc,V =/= StartVertex],
    remove_dups(StartVertexRemoved).

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


