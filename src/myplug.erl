-module(myplug).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    {ok, State1} = myplug_prv:init(State),
    {ok, State1}.
