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

\texttt{\[ \[A,B,20\], \[B,C,20\], \[C,D,20\],\[D,A,20\] \]}

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
@<Create Visited and Unvisted Vertex List@>
@<Get Connected Vertices given a vertex@>
@<Get the Vertex with minimum cost among the connected vertices@>
@<Remove the lowest score vertex from unvisted list@>
@<Assign the connected vertices with new scores@>
@<Repeat getting connected vertices till target is reached@>
@}


