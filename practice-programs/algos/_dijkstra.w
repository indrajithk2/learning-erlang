\section{Dijkstra Algo Description}
I will try to put in my words my understanding of
the algorithm. I think, is easy to get a grasp 
of the algorithm. I will refer to intersections as vertex
and the path connecting between two vertex as edges. 

The algorithm works as follows. The network can be 
assumed to consist of edges and vertices. The task 
is to find the shortest distance between two vertices
in the graph. The graph here denotes the network. 

The question on how to represent a graph will be 
dealt in detail later. For now, let me concentrate on
how the algorithm work. 

We start with we start with a vertex. The input to the 
problem is to find the shortest distance between two 
vertex. So, I know the starting vertex and the destination
vertex. The starting vertex is assigned 0, at start. 
All the other vertex is assigned infinity. Here, I guess, 
I can set a very big value. This has to be compared 
in the course of the algorithm. 

All the connected vertex to starting vertex is 
assigned a value which is equal to the edge value. 
This is assigned so, because the edge value is lesser
than the initial vertex value. Later comparison is made,
and the vertex value is changed only if it is lesser than
the computed value. 

After assigining the vertex value as explained above, all 
the values are compared with each other, and the vertex
with the lowest value is selected as the one to continue
the process. Now all the connected vertices are 
determined and values are assigned. The value is the
value of the vertex from which it is started and the 
edge value. This will be continued the target vertex 
has reached. 

\section{Graph Representation}
Now the question of how the graph will be represented. Let me
see what is required for representation of the graph. The 
graph has vertices and edges. So, I can represent vertices
and edges that should be sufficient to start with. I feel
it should be enough to represent the graph in terms of its
edges and the value on edges. 

Graph can be seen as a list of lists. Each element of the list
is a list with three elements. The elements will be the vertices
and the value of the edge. It will look like \texttt{\[A,B,20\]}.
Here \texttt{A} and \texttt{B} represent the vertices and the 
last element denotes the distance. This way we can represent a 
graph. For example a square can be represented as 

%%\texttt{\[\[A,B,20\], \[B,C,20\], \[C,D,20\],\[D,A,20\] \]}

\section{Strategy}

So, there is a representation of graph as a list of list. As of 
now, I am not going to validate the list. That is a seperate task
by itself.  Assuming the graph is valid, the frist step will be
to know the connected vertices from the start vertex. There 
should be a search function, that can traverse through the graph
and find the connected vertices. The next step will be to modify 
the values on vertices. This will require extraction of values 
from the lists and calculating the value.

So, there should be a representation of the vertices that will
store values of the graph at any point in time. There can be 
a list of visited vertices and not visited vertices. From a 
particular vertex, we don't have to bother the non visited
vertex. 

At any point we are interested in all the connected vertices
and those are unvisted. This will help assign the new values
and proceed.  

To summarize these are the requirements of the program. 

\begin{enumerate}
\item To be able to know all the connected vertices
\item To be able to know of the connected vertices which 
are the unvisited ones.
\item To be able to update the values of the vertices.
\item To be able to extract the edge values.
\end{enumerate}

\section{Code}

@d Overall Code
@{
@<Create Visited and Unvisited Vertex List@>
@<Get Connected Vertices given a vertex@>
@<Get the Vertex with minimum cost among the connected vertices@>
@<Remove the lowest score vertex from unvisted list@>
@<Assign the connected vertices with new scores@>
@<Repeat getting connected vertices till target is reached@>
@}


\subsection{Visited and Unvisited Vertex List}
As a thought process, I was thinking how LP helps
structuring thoughts. That was the experiment I 
started to do with this exercise. Every book talks
about breaking a bigger problem in small sub-problems
and tackle that. LP can help here. In the above section
The overall code flow is described as I am able to think.
No code is written, but I can roughly know what all has
to be created. In a way this is the process of splitting
the big problem into smaller tasks. Now I can pick the 
tasks in any particular order and start working on it. 

This sub section deals with Visited and Unvisited Vertex 
list. The requirement is that through out the program
execution, the Visited and Unvisited list undergoes 
changes depending on the vertex selected based on lowest
cost. To start with except for the start vertex, every other
vertex belongs to unvisited vertex. 

This can be implemented with simple list insertion and
removal method. List removal can be done with list 
comprehension and list insertion. 

@d Create Visited and Unvisited Vertex List
@{
updtd_vstd_vx(Old_Vs,New_V)->[New_V|Old_Vs].
updtd_unvstd_vx(Old_Vs,Vstd_V)->[Vs||Vs<-Old_Vs,Vs =/=Vstd_V].
@}

\section{Find Connected Vertices}
This is an interesting function to implement. The implementation
depends on the way the vertices are represented. I have the 
idea to represent the vertices as a list containing three 
elements. The first and second element are vertex names and the 
last element is the cost. So a vertex can be represented as
\[A,B,20\]. A and B corresponds to the vertices and 20 is the 
cost of the edge connecting A and B. 

Now, to find all the connected vertices given a vertex
is to find the occurance of the given vertex among all the 
vertices that constitues a graph. This will be a brute-force
method. For now it should be OK. 

\subsection{Strategy}
Available data are the graph which is nothing but a list 
of vertices and a given vertex for which all the connected
vertex has to be found. To find a particular vertex is present
in the each vertex, both the vertex contained in the edge has 
to be checked. So, each edge has to be traversed and checked. 
I thing a list comprehension should be able to do that. 

@d Get Connected Vertices given a vertex
@{
lst_of_cnntd_vtxs(Gph,Vtx)->
    [[Vtx1,Vtx2,ED]||[Vtx1,Vtx2,ED]<-Gph,
     Vtx1 =:= Vtx orelse Vtx2 =:= Vtx].
@}

I feel that, I have to still understand list comphrehensions
better. Probably with more practice it will be clearer.

Now, get the connected vertex with minimum cost. As of now, 
no vertex is assigned any value. To start with the starting
vertex will be assigned a value of zero. Before to that a 
representation is required for each vertex to assign a score
to each vertex. This can be accomplished by a list with 
name as the first element and score as the second element. It
will be of the form \[a,20\]. In this case, ``a'' is the vertex
name and ``20'' is the assigned value. At any given point there
will be a list of score list. This list will be updated 
every time new vertex is visited. 

How is the vertices belonging to the shortest path determined.
Once the vertex is decided as the least cost one, then the
edge with the current vertex and the shortest cost has to
be appended to the ``shortest path list''.

The termination condition will be when the targetted vertex
is reached. 

To proceed a list with vertex and score has to be created. 
This vertex will be worked on repeatedly by determining the
least cost vertex from it. After finding the least cost
vertex the edge is stored, and the least cost vertex 
is inserted in the visited vertex list and removed from 
the unvisited list. This list is maintained since 
from a given vertex visiting a visited vertex should not
happen. Hence after getting the connected vertex list, 
any vertex which appears in the visited vertex list 
has to be checked and removed. 

So, I can now imagine that a single iteration of the 
program has to do a lot. 

\begin{enumerate}
\item Get the connected vertices list.
\item Check if there are any visted vertex in list, if so remove it.
\item Determine the least cost vertex. 
\item Add the least cost vertex into visited vertex list.
\item Remove the same from unvisted vertex list.
\item Store the edge between the current vertex and the least cost
vertex into shortest path edge list.
\item With the least cost vertex repeat the process.
\item Repeat this till the target vertex is reached. 
\end{enumerate}


Now I have clarity on how to implement.  Over the night, I was thinking
the number of parameters that will be required for the 
function that will implement the dijkstra's algorithm. That is
going to be many. I am not very happy about the number of
parameters, but that will be required anyway. But externally there
the users is supposed to provide only the graph, start and end vertex. 

The parameters that will be required to be passed will the following.

\begin{enumerate}
\item Input Graph
\item Start Vertex
\item End Vertex
\item Visited Vertex List
\item UnVisited Vertex List
\item Current Vertex
\item Shortest path edge list
\end{enumerate}

Let me now proceed with coding the function which 
implements the dijkstra's algorithm.

@d Get the Vertex with minimum cost among the connected vertices
@{
@<Calculate minimum cost vertex among connected vertices@>

nxt_min_cst_vtx(Gph,CurrVtx,VtxScrs)->
  Cnntd_Vtx  = lst_of_cnntd_vtxs(Gph,CurrNd),
  min_cst_vtx(Cnntd_Vtx,VtxScrs).
@}

CV is the connected vertex list and VS is the vector score
list. Connected Vertex list will be of the form 
\[a,b,c\] and VS will be of the format \[[a,20],[b,30],[c,60],[d,50]\].
Now the task is to get the the element of VS which contains either 
a, b or c for which the score is minimum. In case if there are 
two vertex with same value, then any of the vertex will be 
taken to proceed. This has to be analyzed later what should be
the right approach. 

Check has to be performed whether elements in CV appears in 
VS or not. CV and VS are both list. So the problem is how 
to check if elements of one list appears in the sub list of
the other or not. This is can tried as an independent problem. 

@d Calculate minimum cost vertex among connected vertices 
@{
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
@}

As next step, the edges corresponding to the visited 
vertex has to be stored. This will be final solution.

Once the nearest vertex is found the edge can be 
determined by knowing the current vertex and the 
nearest one. 

As a result of finding the shortest vertex, the value
of the vertex may change if the value stored is greater
than the computed value of the vertex. The computed value
is the sum of the value of the current vertex and the 
edge distance.

One more important thing I learnt here, that problem
solving is about representing the problem -- this can 
be the data structures. Then the algos that can work 
on these data structures to solve the problem,

Till now we don't have a list vertex and scores. We 
have to maintain such a list. The structure of 
the element will be of the form vertex name, score. 
Initially the score of all the vertex will set at a high
value say, 1000. The score of the start vertex will be 
0. From there the program starts. 

@d Initialize the vertex scores.
@{
@<Get all the vertices from the Graph and initialize@>
@<Update the vertex with the new value@>
@}


@d Get all the vertices from the Graph and initialize
@{
vrtx_of_graph(Graph) ->
    [[V,1000]||[V,E,S]<-Graph];
vrtx_of_graph([]) -> [].
@}


@d Update the vertex with the new value
@{
updt_vrtx_scr(VScr,Vtx,Scr)->
    [[V,Scr]||[V,S]->VScr,V=:=Vtx].
@}

The above function just does an update. 
When V is the Vtx to be updated then the score
will be updated to Scr. 


\section{Putting it all together}
Just to recap here is the code flow.

\begin{itemize}
    \item Initialize all the vertex
    \item Initialize the Visited and Unvisited vertex list
    \item Find the nearest vertex
    \item Update the Visited and Unvisted vertex list
    \item Update the Vertex Scores
    \item Check the target vertex has reached or not
    \item Continue once again, if target hasn't reached, other
    wise end here.
\end{itemize}

Also, lets see what is the input and output. The user can give
the graph, start vertex and target vertex as inputs. The return
should be set of edges representing the shortest path. It may
need not be in the same order though. Also, it should also 
return the exact value of the shortest path.

@d Final Program
@{
-module(djikstra).
-export([shortest_path/3]).

shortest_path(Graph, StartVertex, TargetVertex) ->
    %% All the initialization can happen here.
    VisitedVertices = ,
    UnVisitedVertices = ,
    VertexScores = ,
    ShortestPath = ,
    shortest_path(Graph,
                  StartVertex,
                  TragetVertex,
                  VisitedVertices,
                  UnVisitedVertices,
                  VertexScores,
                  ShortestPath).

@}
