open List;;

type event = int * string list
type trace = event list
type interval = int * int

open Printf


type twtl_formula =
    True
  | False
  | Hold of int * string
  | NotHold of int * string
  | And of twtl_formula * twtl_formula
  | Or of twtl_formula * twtl_formula
  | Imply of twtl_formula * twtl_formula
  | Neg of twtl_formula
  | Concat of twtl_formula * twtl_formula
  | Within of interval * twtl_formula
