********************************************************
**file to analyze cheese color data;
**Justin Post - Fall 2014
*******************************************************;

*input data;
data cheese;
input syrup $ rep $ L a b;
datalines;
26 1 51.89 6.22 17.43
26 2 51.52 6.18 17.09
26 3 52.69 6.09 17.59
26 4 52.06 6.36 17.5
26 5 51.63 6.13 17.19
26 6 52.73 6.12 17.5
42 1 47.21 7.02 16
42 2 48.57 6.42 15.91
42 3 47.57 6.84 16.04
42 4 46.85 6.97 15.85
42 5 48.64 6.30 16.21
42 6 47.49 6.91 15.91
55 1 41.43 7.71 13.74
55 2 42.31 7.59 13.98
55 3 42.31 7.63 14.42
55 4 41.49 7.66 13.58
55 5 42.12 7.56 14.03
55 6 42.65 7.55 14.4
62 1 45.99 6.84 15.68
62 2 46.66 6.66 16.3
62 3 47.35 6.49 15.7
62 4 45.83 6.96 15.61
62 5 46.77 6.66 15.91
62 6 47.88 6.34 15.64
;


proc glm data = cheese;
class syrup;
model L = syrup;
lsmeans syrup/pdiff cl adjust = tukey;
run;
quit;

proc means data=cheese;
by syrup;
var L;
run;

proc means data=cheese;
var L;
run;

proc anova data=cheese;
      class syrup;
      model L = syrup;
      means syrup/tukey;
run;




data Clover;
      input Strain $ Nitrogen @@;
      datalines;
   3DOK1  19.4 3DOK1  32.6 3DOK1  27.0 3DOK1  32.1 3DOK1  33.0
   3DOK5  17.7 3DOK5  24.8 3DOK5  27.9 3DOK5  25.2 3DOK5  24.3
   3DOK4  17.0 3DOK4  19.4 3DOK4   9.1 3DOK4  11.9 3DOK4  15.8
   3DOK7  20.7 3DOK7  21.0 3DOK7  20.5 3DOK7  18.8 3DOK7  18.6
   3DOK13 14.3 3DOK13 14.4 3DOK13 11.8 3DOK13 11.6 3DOK13 14.2
   COMPOS 17.3 COMPOS 19.4 COMPOS 19.1 COMPOS 16.9 COMPOS 20.8
   ;
   proc anova data=Clover plots=all;
      class Strain;
      model Nitrogen = Strain;
      means Strain / tukey;
   run;

   proc glm data=Clover plots=all;
   	class strain;
	model nitrogen = strain;
	lsmeans strain/pdiff cl;
	run;
