:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).

:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

:- consult(get_response).

:- initialization main.
:- http_handler(/, index, []).
:- http_handler('/calc', calc, []).

index(_) :-
    format('Content-type: text/plain~n~n'),
    format('This is a simple calculator server~n~n'),
    format('Calculator endpoint is /calc~n~n'),
    format('Request is a POST JSON with scheme:~n'),
    format('{~n'),
    format('    "operator": "add"|"sub"|"mul"|"div"|"pow"|"sqrt",~n'),
    format('    "arguments": list of operator arguments~n'),
    format('}~n~n'),
    format('Response is a JSON with scheme:~n'),
    format('{~n'),
    format('    "operator": same as in request,~n'),
    format('    "arguments": same as in request,~n'),
    format('    "error": error explaination | null,~n'),
    format('    "result": calculated result if there wasn\'t any error | null~n'),
    format('}~n~n').

calc(Request) :-
    http_read_json_dict(Request, DictIn),
    get_response(DictIn, Response),
    reply_json(Response).

main :-
  http_server(http_dispatch, [port(3000)]),
  thread_get_message(quit).
