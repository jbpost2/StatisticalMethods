***************************************************
**File to analyze the Campylobacter data
**Used in mixed models section notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data bashor;
infile "bashor.dat" firstobs=3;
input day location y; 
ly=log(y);
run;

*analyze mixed model;
proc mixed data=bashor method=type3 plots=all;
class day location;
model y=location;
random day day*location;
run;

*get lsmeans;
proc mixed data=bashor method=type3 plots=all;
class day location;
model ly=location;
random day day*location;
lsmeans location/adjust=tukey cl;
run;

*same analysis in glm, wrong tests!;
proc glm data=bashor;
class location day;
model ly=location day day*location;
random day day*location;
run;
