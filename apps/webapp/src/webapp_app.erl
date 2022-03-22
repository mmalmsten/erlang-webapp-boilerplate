%%%-------------------------------------------------------------------
%% @doc webapp public API
%% @end
%%%-------------------------------------------------------------------

-module(webapp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, Pid} = webapp_sup:start_link(),
    Routes = [{'_', [{"/", webapp_handler, []}]}],
    Dispatch = cowboy_router:compile(Routes),

    TransOpts = [{ip, {0, 0, 0, 0}}, {port, 3000}],
    ProtoOpts = #{env => #{dispatch => Dispatch}},

    {ok, _} = cowboy:start_clear(webapp, TransOpts, ProtoOpts),
    
    {ok, Pid}.

stop(_State) ->
    ok.

%% internal functions
