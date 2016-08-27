\documentclass[12pt, a4paper]{book}
\newif\ifshowcode
\showcodetrue

\usepackage{latexsym}

\usepackage{listings}

\usepackage{color}
\definecolor{linkcolor}{rgb}{0, 0, 0.7}

\usepackage{xcolor}
\newcommand\mytodo[1]{\textcolor{red}{#1}}

\usepackage[%
backref,%
raiselinks,%
pdfhighlight=/O,%
pagebackref,%
hyperfigures,%
breaklinks,%
colorlinks,%
pdfpagemode=None,%
pdfstartview=FitBH,%
linkcolor={linkcolor},%
anchorcolor={linkcolor},%
citecolor={linkcolor},%
filecolor={linkcolor},%
menucolor={linkcolor},%
pagecolor={linkcolor},%
urlcolor={linkcolor}%
]{hyperref}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\textheight}{8.9in}
\setlength{\textwidth}{6.5in}
\setlength{\marginparwidth}{0.5in}

\title{Declare Functions Outside}
\date{27th Aug, 2016}
\author{Indirajith K}

\begin{document}
%%  http://stackoverflow.com/questions/39060259/declare-variables-outside-of-erlang-functions

\section{Example}


@d Complete Program
@{
-module(varoutside).
-export([get_weather/1]).

get_weather(City) ->
    Weather = [
    {toronto, rain},
    {montreal, stroms},
    {london, fog},
    {paris, sun},
    {boston, fog},
    {vancouver, snow}
    ],
    [LocationWeather || {Location,LocationWeather}<-Weather,
     Location =:= City].

@}

\section{Understanding the Program}
When I started reading the program, I was not
able to understand the program very well. I was
bit confused what the list comprehension was doing. 
But, finally when I started writing the program, I understood 
what is the intention of the program. The problem I had was 
that, I was not knowing what the function was expected to 
do. So, let me put that first --- the program is trying to 
return the local weather of a given city. For this, 
it is referring to a list it has constructed in the 
same scope as that of the function. And then there 
is a list comprehension, when matches each item 
in the list agains the location. When the location 
matches that of the city, a single element list containing
the location weather will be returned. 

\section{Query in SO}
So, now what is the question asked. The author wants to 
know if Weather can be declared outside the scope of the 
function. 

\section{Discussion of Answers}

\subsection{Answer - 01}
One suggestion given was to represent the data in functions as below.

@d Data as functions
@{
get_weather(toronto)->rain;
get_weather(montreal)-> storms;
get_weather(london)->fog;
get_weather(paris)->sun;
get_weather(boston)->fog;
get_weather(vancouver)->snow.
@}


\subsection{Answer -02}

The next suggestion is to create a list outside. 

weather_data() -> [
    {toronto,rain},
    {london,fog},
    {paris,sun},
    {boston,fog},
    {vancouver,snow}
].


@o varoutside.erl
@{@<Complete Program@>
@}
\end{document}
