# Definitions
## Event
An event is defined as a pair of time-stamp and set/list of propositions, e.g., (1,[p1,p2,p3]) where "1" is time stamp and [p1,p2,p3] is the list of porpositions which are true at this time instant.
```
type event = int * string list
```
## Trace
A trace is defined is list of events, e.g., t = [(1,[p,q]),(2,[p]),(3,[p,q,r])]. Note that time stamps are assumed to be strictly increasing, i.e., t_i < t_i+1 < t_i+2 < ... 
```
type trace = event list
```
## Interval
A closed interval is defined as a pair of integers  and it represents [i,j]

```
type interval = int * int
```
