************************************************************
**Summary Stats for Pipe Example
**Justin Post - Fall 2014 
***********************************************************;

data pipes;
input Width Method $;
datalines;
4.7 A
3.7 A
3.2  A
3.1  A
3.9 A
4.8 A
3.1 A
5.1 A
4.9 A
5.3 A
2.8 A
4.2 A
3.7 B
4.1 B
3.5 B
5.5 B
4.1 B
4.7 B
4.9 B
3.5 B
3.9 B
3.7 B
4.8 B
5.0 B
5.3 B
4.4 B
4.6 B
;

proc univariate data=pipes;
by Method;
run;
