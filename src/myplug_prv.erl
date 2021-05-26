-module(myplug_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, myplug).
-define(DEPS, [compile]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 myplug"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "A rebar plugin"},
            {desc, "A rebar plugin"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    App = get_app_name(State),
    io:format("~p ~p App: '~p' ~n", [?MODULE, ?LINE, App]),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

-spec get_app_name(State) -> Res when
      State :: rebar_state:t(),
      Res :: binary().
get_app_name(State) ->
    AppInfo = get_app_info(State),
    rebar_app_info:name(AppInfo).

get_app_info(State) ->
    [Info | _] =
        case rebar_state:current_app(State) of
            undefined ->
                rebar_state:project_apps(State);
            I ->
                [I]
        end,
    Info.
