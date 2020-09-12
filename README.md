# Rewriting Algorithm for Time Window Temporal Logic

## Executable: twtl.native

## Command-line Options

- Interactive Verification (receives events through command-line)
```
./twtl.native -interactive "(A holds_for 3) within [0,5]"
```
- Automatic Verification (accepts a folder which contains traces, e.g., t1.trace, t2.trace, etc.)

- Format for the trace file:

```
0 A B C
1 A
2 A
3 A B C D E
```

- Example ("traces" is a folder name)

```
./twtl.native -automatic "(A holds_for 3) within [0,5]" "traces"
```
- Result (Time in "seconds" and Memory in "words")

```
====================Result========================= 
traces/t2.trace: 
Verdict = False Time = 7.1e-05 Memory = 467.
traces/t6.trace: 
Verdict = True Time = 0.000144 Memory = 386.
traces/t1.trace: 
Verdict = True Time = 5.1e-05 Memory = 386.
traces/t10.trace: 
Verdict = False Time = 8.2e-05 Memory = 467.
traces/t3.trace: 
Verdict = True Time = 6.1e-05 Memory = 386.
traces/t7.trace: 
Verdict = False Time = 8.8e-05 Memory = 467.
traces/t5.trace: 
Verdict = True Time = 5.2e-05 Memory = 386.
traces/t9.trace: 
Verdict = False Time = 0.000101 Memory = 467.
traces/t4.trace : 
Verdict = True Time = 6.4e-05 Memory = 386.
traces/t8.trace: 
Verdict = False Time = 0.000123 Memory = 467.
=================================================== 
```

## Examples for Syntax

```
A holds_for 3
```

```
(A holds_for 3) * (B holds_for 3)
```

```
(A holds_for 3) within [0,5]
```