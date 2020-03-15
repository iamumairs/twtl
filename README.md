# Rewriting for Time Window Temporal Logic

## Examples for Syntax

```
A holds_for 3
'''


```
(A holds_for 3) * (A holds_for 3) 
'''


```
(A holds_for 3) within [0,5]
'''


```
./twtl.native "A holds_for 3"
======================================== 
Entered TWLTL Formula: A holds_for 3 time units
======================================== 
Enter the Event in the form: time_point a b c):0 A B C 
======================================== 
Pure Rewrite Step: True & A holds_for 2 time units
======================================== 
======================================== 
Simplified Formula: A holds_for 2 time units
======================================== 
Enter the Event in the form: time_point a b c):1 A D
======================================== 
Pure Rewrite Step: True & A holds_for 1 time units
======================================== 
 ======================================== 
Simplified Formula: A holds_for 1 time units
======================================== 
Enter the Event in the form: time_point a b c):2 A E
======================================== 
Pure Rewrite Step: True
======================================== 
======================================== 
Simplified Formula: True
======================================== 
**** STOPPING: Further rewriting will not change the evaluation **** 
'''
