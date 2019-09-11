***************************************************
**File to analyze the sire data
**Used in random effects section notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data Sires;
input Sire @;
do i=1 to 8;
input BirthWeight @; output;
end;
cards;
177 61 100 56 113 99 103 75 62
200 75 102 95 103 98 115 98 94
201 58 60 60 57 57 59 54 100
202 57 56 67 59 58 121 101 101
203 59 46 120 115 115 93 105 75
;
run;


*run incorrect glm analysis;
proc glm data=sires;
class sire;
model BirthWeight=Sire;
random Sire;
run;

*run correct mixed analysis using type3 estimation (equating sums of squares);
proc mixed data=sires method=type3;
class sire;
model BirthWeight=;
random Sire;
estimate 'mean' intercept 1/cl;
run;

*repeat using reml;
proc mixed data=sires method=reml cl;
class sire;
model BirthWeight=;
random Sire;
estimate 'mean' intercept 1/cl;
run;

