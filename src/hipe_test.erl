%%%-------------------------------------------------------------------
%%% @author HIROE Shin <shin@HIROE-no-MacBook-Pro.local>
%%% @copyright (C) 2013, HIROE Shin
%%% @doc
%%%
%%% @end
%%% Created :  1 Nov 2013 by HIROE Shin <shin@HIROE-no-MacBook-Pro.local>
%%%-------------------------------------------------------------------
-module(hipe_test).

%% API
-export([start/0, tak/3]).

-define(SAMPLE_COUNT, 10).

%%%===================================================================
%%% API
%%%===================================================================

start() -> 
    start(?SAMPLE_COUNT).

start(Count) ->
    tak(18, 9, 0), %% 一回やっとく
    Total = test(Count, 0),
    io:format("--------------average-------------~n"),
    io:format("~w~n", [Total / Count]),
    ok.

test(0, Total) -> 
    Total;

test(Count, Total) ->
    {Time, _} = timer:tc(?MODULE, tak, [18, 9, 0]),
    io:format("~w~n", [Time]),
    test(Count - 1, Total + Time).

tak(X, Y, Z) when X =< Y -> Z;
tak(X, Y, Z) -> tak(tak(X - 1, Y, Z), tak(Y - 1, Z, X), tak(Z - 1, X, Y)).

%%%===================================================================
%%% Internal functions
%%%===================================================================
