# Definitions
## Event
An event is defined as a pair of time-stamp and set/list of propositions, e.g., (1,[p1,p2,p3]) where "1" is time stamp and [p1,p2,p3] is the list of porpositions which are true at this time instant.
```ocmal
type event = int * string list
```
## Trace
A trace is defined is list of events, e.g., t = [(1,[p,q]),(2,[p]),(3,[p,q,r])]. Note that time stamps are assumed to be strictly increasing, i.e., t_i < t_i+1 < t_i+2 < ... 
```ocmal
type trace = event list
```
## Interval
A closed interval is defined as a pair of integers  and it represents [i,j]

```ocmal
type interval = int * int
```

## TWTL Syntax

```ocaml
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
```
