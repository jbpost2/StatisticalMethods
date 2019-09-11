***************************************************
**File to analyze the adsorption data
**Used in MLR section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data adexp;
input adsorp aluminum iron;
datalines;
4 13 61
18 21 175
14 24 111
18 23 124
26 64 130
26 38 173
21 33 169
30 61 169
28 39 160
36 71 244
65 112 257
62 88 333
40 54 199
;

*Print data to check on it;
proc print data=adexp;run;

*output to a pdf;
ods pdf file="mlradexp.pdf";
*Run additive MLR model;
title 'Output From Proc Reg for Adsorption Example';
proc reg data=adexp ;
model adsorp=aluminum iron/clb;
run;
quit;
ods pdf close;

*Add in new data set to get PI and CI for;
data newad;
input adsorp aluminum iron;
datalines;
. 100 150
;
*append new data set to old one;
proc datasets;
append base=adexp data=newad;
run;

*Rerun additive MLR analysis to get CI and PI for given x's;
proc reg data=adexp ;
model adsorp=aluminum iron/clb r clm cli;
run;
quit;


*Run same analysis in proc glm instead of proc reg;
proc glm data=adexp plots=all;
* can only run one of clm or cli at once;
*model adsorp=aluminum iron/solution clparm clm;
*solution gives the fitted model parameters, clparm requests CIs for those parameters;
model adsorp=aluminum iron/solution clparm cli;
run;

*Interaction MLR analysis in proc glm;
proc glm data=adexp plots=all;
model adsorp=aluminum iron aluminum*iron/solution clparm clm cli;
run;
