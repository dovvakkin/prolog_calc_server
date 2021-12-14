common_error(DictIn, "No arguments given") :-
    \+ get_dict(arguments, DictIn, _).

common_error(DictIn, "No operator given") :-
    \+ get_dict(operator, DictIn, _).

common_error(DictIn, "Arguments always must be list") :-
    \+ is_list(DictIn.arguments).

common_error(DictIn, "Not supported operator") :-
    \+ member(DictIn.operator, ["add","sub","mul","div","pow","sqrt"]).

common_error(_, null).

/* ------------------------------------------------------------------------------- */

sum_error(DictIn, "Incorrect arguments number for add") :-
    \+ length(DictIn.arguments, 2).

sum_error(_, null).

/* ------------------------------------------------------------------------------- */

sub_error(DictIn, "Incorrect arguments number for sub") :-
    \+ length(DictIn.arguments, 2).

sub_error(_, null).

/* ------------------------------------------------------------------------------- */

div_error(DictIn, "Incorrect arguments number for div") :-
    \+ length(DictIn.arguments, 2).

div_error(DictIn, "Division by zero") :-
    [_, Divider| _] = DictIn.arguments,
    Divider = 0.

div_error(_, null).

/* ------------------------------------------------------------------------------- */

mul_error(DictIn, "Incorrect arguments number for mul") :-
    \+ length(DictIn.arguments, 2).

mul_error(_, null).

/* ------------------------------------------------------------------------------- */

sqrt_error(DictIn, "Incorrect arguments number for sqrt") :-
    \+ length(DictIn.arguments, 1).

sqrt_error(DictIn, "Argument less than 0") :-
    [To_sqrt| _] = DictIn.arguments,
    To_sqrt < 0.

sqrt_error(_, null).

/* ------------------------------------------------------------------------------- */

pow_error(DictIn, "Incorrect arguments number for pow") :-
    \+ length(DictIn.arguments, 2).

pow_error(DictIn, "Raising zero to a non-positive power") :-
    [Fst, Snd| _] = DictIn.arguments,
    Fst = 0,
    Snd =< 0.

pow_error(_, null).
