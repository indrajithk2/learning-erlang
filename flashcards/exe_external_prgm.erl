-module(exe_external_prgm).
-export([execute/1]).

%% The user just passes one command, and the 
%% program will execute it and return result.
execute(Cmd) -> os:cmd(Cmd).
