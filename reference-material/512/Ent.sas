***************************************************
**File to analyze the honeybee data on sucrose and temperature
**Used in multiway ANOVA section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data ent;
input temp Suc trt energy; 
datalines;
20 20 1 3.1 
20 20 1 3.7 
20 20 1 4.7
20 40 2 5.5 
20 40 2 6.7 
20 40 2 7.3
30 20 3 6 
30 20 3 6.9 
30 20 3 7.5
30 40 4 11.5 
30 40 4 12.9 
30 40 4 13.4
40 20 5 7.7 
40 20 5 8.3 
40 20 5 9.5
40 40 6 15.7 
40 40 6 14.3 
40 40 6 15.9
;

*Fit Two-way ANOVA model;
proc glm data=ent;
class Temp Suc;
model Energy=Temp|Suc;*Vertical Bar fits all combinations of Temp and Suc (main effects and interactions);
run;

*Find the means for each treatment group without using glm;
title 'Means for each treatment group';
proc tabulate data=ent;
class Temp Suc;
var Energy;
table Temp*mean, Energy*Suc;
run;

*Get pairwise differences of simple effects with tukey correction;
proc glm data=ent;
class Temp Suc;
model Energy=Temp|Suc;*Vertical Bar fits all combinations of Temp and Suc (main effects and interactions);
lsmeans Temp*Suc/adjust=tukey pdiff cl;
run;

*Get tests for certain groups of simple effects together (not discussed in class);
proc glm data=ent;
class Temp Suc;
model Energy=Temp|Suc;*Vertical Bar fits all combinations of Temp and Suc (main effects and interactions);
lsmeans Temp*Suc/slice=Suc adjust=bonferonni;
lsmeans Temp*Suc/slice=Temp;
run;









