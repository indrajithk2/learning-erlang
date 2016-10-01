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

\title{Literate Programming Template}
\date{}
\author{Indirajith K}

\begin{document}

\section{Variables in Registers}

TeX provides variables, the interesting
thing is that, they are already named. May 
be that is the reason it is called registers. 
You can store values into the registers, and 
manipulate as required. 

The most interesting part of this, is that, 
there are only limited registers. Which means
the usage has to be rationed. In regular 
programming we don't worry about the number
of variables available. But, in TeX yes, you
have to worry about it. This could have been
due to limited computing resources available
during the time TeX originated. Macros seems 
to be a way to overcome this restriction. But
macros are strings. Also, how various operations
can be performed on macros is still to be seen.

\subsection{Using Registers}

\begin{verbatim}


\end{verbatim}


\end{document}


