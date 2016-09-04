-module(large).
-export([largest_num/1,min_cst_vtx/2]).

largest_num(L)->largest_num_impl(L,0).
largest_num_impl([H|T],A)->
    if
        H > A -> largest_num_impl(T,H);
        A > H -> largest_num_impl(T,A)
    end;
largest_num_impl([],A)->A.

min_cst_vtx(CV,VS)-> 
    %%Extract the element from VS to check against CV
    VS_Elms = [[X,Y]||[X,Y]<-VS,st_e_in_l(X,CV)],
    %% Get the minimum Vertex with minimum score
    min_cst_vtx1(VS_Elms,["",1000]).

min_cst_vtx1([H|T],Acc)->
    [_,ScV] = H,
    [_,ScL] = Acc,
    if 
        %% There should be an elegant way
        ScL >= ScV ->min_cst_vtx1(T,H);
        ScV >= ScL -> min_cst_vtx1(T,Acc)
    end;
min_cst_vtx1([],Acc)->Acc.

%% Status of element E is in list L
st_e_in_l(E,[H|T])->
    if 
        H =:= E -> true;
        H =/= E -> st_e_in_l(E,T)
    end;
st_e_in_l(_,[])->false.
    
