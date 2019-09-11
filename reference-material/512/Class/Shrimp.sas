data shrimp;
   drop i;
   input Temp Density Salinity @;
   do i=1 to 3;
   input y @;
   y0=sqrt(y);
   output;
   end;
   cards;
   25 80 10 86 52 73
   25 80 25 544 371 482
   25 80 40 390 290 397 
   25 160 10 53 73 86
   25 160 25 393 398 208
   25 160 40 249 265 243
   35 80 10 439 436 349
   35 80 25 249 245 330
   35 80 40 247 277 205
   35 160 10 324 305 364
   35 160 25 352 267 316
   35 160 40 188 223 281
;
run;

symbol1 i=join value=dot;
symbol2 i=join value=plus;

proc sort;  by Density; run;

proc means noprint nway;  class Temp Density Salinity;  var y; output out=shrimp2 mean=ymean;run;

proc sort;  by Density; run;
proc gplot data=shrimp2;
   by Density;
   plot ymean*Temp=Salinity;
run;

ods graphics on;
proc glm data=shrimp plots=diagnostics;
class Temp Density Salinity;
model y=Temp|Density|Salinity;
run;
ods graphics off;

ods graphics on;
proc glm data=shrimp plots=diagnostics;
class Temp Density Salinity;
model y0=Temp|Density|Salinity;
run;
ods graphics off;


proc mixed data=shrimp;
class temp density salinity;
model y=temp|density|salinity;
lsmestimate temp*density*salinity 'int'  [1,2 1 1] [-1,1 1 1] ;
run;
