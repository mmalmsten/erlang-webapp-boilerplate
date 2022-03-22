-module(webapp_app).

-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_', [{"/", webapp_handler, []}]}]),
    {ok, _} =
        cowboy:start_clear(my_http_listener, [{port, 3000}], #{env => #{dispatch => Dispatch}}),
    webapp_sup:start_link().

stop(_State) ->
    ok.
