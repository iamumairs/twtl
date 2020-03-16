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
### Ocaml Type Definition for TWTL

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
### Backus Naur form for TWTL
```
phi = T | F | Hold (d,p) | NotHold (d,p) | phi_1 & phi_2 | phi_1 || phi_2 | 
      ~ phi | phi_1 Imply phi_2  | phi_1  * phi_2 | phi within [ti,tj] 
```
## Helper Functions

Following two functions "p_event" and "t_event" accept an event and provide the coresponding list of propositions and time-stamp, respectively.

```ocaml
let p_event (e:event) = snd e 
let t_event (e:event) = fst e 
```
For example, p_event (1,[p,q]) = [p,q] and t_event (1,[p,q]) = 1.

## Progress Function
Note that the progress function accepts an twtl formula and i-th event and return a twtl formula. 
```ocaml
Progress: twtl_formula x event -> twtl_formula
```
### True 
```Ocaml 
Progress True ei = True
```
### False 
```Ocaml 
Progress False ei = False
```
### Hold
Not that in match statement " _ " represents any other case. 

```ocaml
Progress Hold(d,p) ei =  match d with 
                             | 1 -> if (p IN (p_event ei) then True else False 
                             | _ -> (if (p IN (p_event ei) then True else False) & Hold(d-1,p)
```                             
### NotHold
```ocaml
Progress NotHold(d,p) ei =  match d with 
                             | 1 -> if (p NOT_IN (p_event ei) then True else False 
                             |  -> (if (p NOT_IN (p_event ei) then True else False) & NotHold(d-1,p)
```  
### And 
```ocaml
Progress (f_1 & f_2) ei = (Progress f_1 ei) & (Progress f_2 ei)
```
### Or 
```ocaml
Progress (f_1 || f_2) ei = (Progress f_1 ei) || (Progress f_2 ei)
```

### Imply
```ocaml
Progress (f_1 || f_2) ei = ~(Progress f_1 ei) || (Progress f_2 ei)
```

### Neg
```ocaml
Progress (~ f) ei = ~(Progress f ei) 
```

### Concat 
```ocaml
Progress (f_1 * f_2) ei = if (progress f_1 ei) = True then (progress f_1 ei) 
                          else Concat((progress f_1 ei),f_2))
```
### Within 
```ocaml
Progress (f Within [t,t']) ei = (progress f ei) ||  (f Within [t-1,t'-1])
```
