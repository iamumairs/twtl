
(* The type of tokens. *)

type token = 
  | WITHIN
  | UNDER
  | TRUE
  | OR
  | OPEN
  | OP
  | NOT
  | NHOLD
  | INTERVAL
  | INT of (int)
  | IMPL
  | ID of (string)
  | HOLD
  | FALSE
  | EQUIV
  | EOF
  | DOT
  | CONCAT
  | COMMA
  | CLOSE
  | CL
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val parse_twtl_formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Formula.twtl_formula)
