***************************************************
**File to analyze the binding fraction of antibiotics on bovines
**Used in contrast section notes
**Justin Post - Spring 2015
**************************************************;

data binding;
input BindFrac Antibiotic $;
datalines;
29.6 PenicillinG
24.3 PenicillinG 
28.5 PenicillinG 
32.0 PenicillinG 
27.3 Tetracyclin
32.6 Tetracyclin
30.8 Tetracyclin
34.8 Tetracyclin
5.8 Streptomycin
6.2 Streptomycin
11.0 Streptomycin
8.3 Streptomycin
21.6 Erythromycin
17.4 Erythromycin
18.3 Erythromycin
19.0 Erythromycin
29.2 Chloramphenicol
32.8 Chloramphenicol
25.0 Chloramphenicol
24.2 Chloramphenicol
;

*sort data for use with proc means;
proc sort data=binding;
by antibiotic;
run;

*Find mean for each antibiotic;
proc means data=binding;
by antibiotic;
run;

*Find overall mean;
proc means data=binding;
run;

*Run one-way ANOVA analysis with proc ANOVA;
proc anova;
class antibiotic;
model BindFrac = Antibiotic;
run;

*To create boxplot, SAS needs a group variable - give all observations same group;
data binding;
set binding;
group=1;
run;

*Creat boxplot;
proc boxplot;
plot BindFrac*group;
run;

*******************************************************
*Comparison of means;

*Output to pdf;
ods pdf file="BindFracContrasts.pdf";
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic;
*Get group means, lsd, cldiff, lines are requests for pairwise differences;
means antibiotic/ lsd cldiff lines;
*Same except get least squares means (this should usually be used instead of raw means);
lsmeans antibiotic/stderr pdiff;
run;
ods pdf close;

*Get some estimates by hand;
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic/clparm;
estimate 'lsmean for trt 2' intercept 1 antibiotic 0 1 0 0 0;
estimate 'avg of trt 2 mean and trt 3 mean' intercept 2 antibiotic 0 1 1 0 0/divisor=2;
estimate 'trt 1 vs trt 5' intercept 0 antibiotic 1 0 0 0 -1;
estimate 'avg of 1 and 2 vs avg of 3 and 4' intercept 0 antibiotic 1 1 -1 -1 0/divisor=2;
run;

*Get some estimates by hand using mixed instead;
proc mixed data=binding;
class antibiotic;
model bindfrac=antibiotic;
lsmestimate antibiotic 'lsmean for trt 2' [1,2]/cl;
lsmestimate antibiotic 'avg of trt 2 mean and trt 3 mean' [0.5,2] [0.5,3]/cl;
lsmestimate antibiotic 'trt 1 vs trt 5' [1,1] [-1,5]/cl;
lsmestimate antibiotic 'avg of 1 and 2 vs avg of 3 and 4' [1,1] [1,2] [-1,3] [-1,4]/divisor=2 cl;
run;


*Bonferonni correction for estimates;
title 'Bonferroni Output';
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic/clparm alpha=0.0125;
*Can drop intercept since it has 0 coefficient;
estimate 'theta 1' antibiotic 1 -1; 
estimate 'theta 2' antibiotic 1 0 -1;
estimate 'theta 3' antibiotic 1 0 0 -1 0;
estimate 'theta 4' antibiotic 1 0 0 0 -1;
run;

*Bonferonni correction for estimates using mixed;
proc mixed data=binding;
class antibiotic;
model bindfrac=antibiotic;
lsmestimate antibiotic 'theta 1' [1,1] [-1,2],
'theta 2' [1,1] [-1,3],
'theta 3' [1,1] [-1,4],
'theta 4' [1,1] [-1,5]/cl adjust=bon;
run;


*Scheffe/Tukey correction;
title 'Scheffe/Tukey Output';
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic;
lsmeans antibiotic/pdiff adjust=scheffe cl;
lsmeans antibiotic/pdiff adjust=tukey cl;
run;

*Scheffe/Tukey correction using mixed;
proc mixed data=binding;
class antibiotic;
model bindfrac=antibiotic;
lsmeans antibiotic/pdiff adjust=tukey cl;
lsmestimate antibiotic 'theta 1' [1,1] [-1,2],
 'theta 2' [1,1] [-1,3],
 'theta 3' [1,1] [-1,4],
 'theta 4' [1,1] [-1,5]/cl adjust=scheffe;
run;


*Decomposition of SS(Trt) into certain contrasts;
title 'Contrast Sums of Squares';
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic;
contrast 'theta 1' antibiotic -2 -1 0 1 2;
contrast 'theta 2' antibiotic 2 -1 -2 -1 2;
contrast 'theta 3' antibiotic -1 2 0 -2 1;
contrast 'theta 4' antibiotic 1 -4 6 -4 1;
run;

*Decomposition of SS(Trt) into certain contrasts using mixed;
proc mixed data=binding;
class antibiotic;
model bindfrac=antibiotic;
lsmestimate antibiotic 'theta 1' [-2,1] [-1,2] [0,3] [1,4] [2,5],
 'theta 2' [2,1] [-1,2] [-2,3] [-1,4] [2,5], 
 'theta 3' [-1,1] [2,2] [0,3] [-2,4] [1,5],
 'theta 4' [1,1] [-4,2] [6,3] [-4,4] [1,5]; 
run;


********************************************************
*Get GLM solution of the model;
proc glm data=binding;
class antibiotic;
model bindfrac=antibiotic/solution inverse;
run;
