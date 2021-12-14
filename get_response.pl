:- consult(errors).

get_response(DictIn, ResDict) :-
    common_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "add",
    sum_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "add",
    [Fst, Snd | _] = DictIn.arguments,
    Res is Fst + Snd,
    ResDict = DictIn.put([error=null, result=Res]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "sub",
    sub_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "sub",
    [Fst, Snd | _] = DictIn.arguments,
    Res is Fst - Snd,
    ResDict = DictIn.put([error=null, result=Res]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "div",
    div_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "div",
    [Fst, Snd | _] = DictIn.arguments,
    Res is Fst / Snd,
    ResDict = DictIn.put([error=null, result=Res]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "mul",
    mul_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "mul",
    [Fst, Snd | _] = DictIn.arguments,
    Res is Fst * Snd,
    ResDict = DictIn.put([error=null, result=Res]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "sqrt",
    sqrt_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "sqrt",
    [Fst | _] = DictIn.arguments,
    Res is sqrt(Fst),
    ResDict = DictIn.put([error=null, result=Res]).

/* ------------------------------------------------------------------------------- */

get_response(DictIn, ResDict) :-
    DictIn.operator = "pow",
    pow_error(DictIn, E),
    E \= null,
    ResDict = DictIn.put([error=E, result=null]).

get_response(DictIn, ResDict) :-
    DictIn.operator = "pow",
    [Fst, Snd | _] = DictIn.arguments,
    Res is Fst ** Snd,
    ResDict = DictIn.put([error=null, result=Res]).
