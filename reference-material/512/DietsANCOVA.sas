***************************************************
**File to analyze the diet data with a covariate
**Used in GLM section of notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data diets;
input diet $ gain caloric @@;
datalines;
1  48  350  2  65  400  3  79  510  4  59  530
1  67  440  2  49  450  3  52  410  4  50  520
1  78  440  2  37  370  3  63  470  4  59  520
1  69  510  2  75  530  3  65  470  4  42  510
1  53  470  2  63  420  3  67  480  4  34  430
;
run;

*sort data for use with proc means;
proc sort;
by diet;
run;

*find means of gain and caloric intake by diet;
proc means;
var gain caloric;
by diet;
run;

*Fit basic One-way ANOVA model;
proc anova data=diets;
class diet;
model gain = diet;
run;

*Output to pdf;
ods pdf file="DietsANCOVA.pdf";
*Fit ANCOVA model (a GLM);
proc glm data=diets;
class diet;
model gain = diet caloric;
run;
ods pdf close;

*Same except get the resulting beta vector and xpx inverse matrix;
proc glm data=diets;
class diet;
model gain = diet caloric/solution inverse;
*Get raw means;
means diet/;
*Get lsmeans with CIs and SEs for each;
lsmeans diet/stderr cl;
run;

*Same as above except get differences of lsmeans with a tukey correction;
proc glm data=diets;
class diet;
model gain = diet caloric/solution inverse;
lsmeans diet/adjust=tukey cl;
run;

