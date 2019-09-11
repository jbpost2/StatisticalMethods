data bashor;
infile "bashor.dat" firstobs=3;
input day location y; 
ly=log(y);
run;

proc mixed data=bashor method=type3 plots=all;
class day location;
model y=location;
random day day*location;
run;

proc mixed data=bashor method=type3 plots=all;
class day location;
model ly=location;
random day day*location;
lsmeans location/adjust=tukey cl;
run;

proc glm data=bashor;
class location day;
model ly=location day day*location;
random day day*location;
run;
