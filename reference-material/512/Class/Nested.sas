data phosph;
input y time $ technician;
datalines;
42 am 1
44 am 1 
43 am 1 
44 am 1
43 am 2 
44 am 2
45 am 2
42 am 2
47 am 3
46 am 3
47 am 3
43 am 3
50 pm 1 
49 pm 1
52 pm 1
50 pm 1
49 pm 2
48 pm 2
49 pm 2
47 pm 2
47 pm 3
51 pm 3
46 pm 3
48 pm 3
;

proc glm data=phosph plots=NONE;
class time technician;
model y=time technician(time)/clparm;
lsmeans time technician(time)/adjust=tukey cl;
estimate 'effect of Time' intercept 0 time 3 -3 technician(time) 1 1 1 -1 -1 -1/divisor=3; 
estimate 'effect of Tech 1/2 within Time=AM' intercept 0 time 0 0 technician(time) 1 -1 0 0 0 0;
estimate 'effect of Tech 1/3 within Time=AM' intercept 0 time 0 0 technician(time) 1 0 -1 0 0 0;
estimate 'effect of Tech 2/3 within Time=AM' intercept 0 time 0 0 technician(time) 0 1 -1  0 0 0;
estimate 'effect of Tech 1/2 within Time=PM' intercept 0 time 0 0 technician(time) 0 0 0 1 -1 0;
estimate 'effect of Tech 1/3 within Time=PM' intercept 0 time 0 0 technician(time) 0 0 0 1 0 -1;
estimate 'effect of Tech 2/3 within Time=PM' intercept 0 time 0 0 technician(time) 0 0 0 0 1 -1;
run;
