***************************************************
**File to analyze the bodyfat data
**Used in MLR section notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data bodyfat;
   input x1 x2 x3 y;
   cards;
  19.5  43.1  29.1  11.9
  24.7  49.8  28.2  22.8
  30.7  51.9  37.0  18.7
  29.8  54.3  31.1  20.1
  19.1  42.2  30.9  12.9
  25.6  53.9  23.7  21.7
  31.4  58.5  27.6  27.1
  27.9  52.1  30.6  25.4
  22.1  49.9  23.2  21.3
  25.5  53.5  24.8  19.3
  31.1  56.6  30.0  25.4
  30.4  56.7  28.3  27.2
  18.7  46.5  23.0  11.7
  19.7  44.2  28.6  17.8
  14.6  42.7  21.3  12.8
  29.5  54.4  30.1  23.9
  27.7  55.3  25.7  22.6
  30.2  58.6  24.6  25.4
  22.7  48.2  27.1  14.8
  25.2  51.0  27.5  21.1
  25     50    29    .
;

*output to pdf;
ods pdf file="bodyfatexample.pdf";
*run candidate model analyses;
title 'Output From Proc Reg for Bodyfat Example';
proc reg data=bodyfat plots=none;
   model y=x1/covb;
   model y=x2/covb;
   model y=x3/covb;
   model y=x1 x2/covb;
   model y=x1 x2 x3/covb;
run;
ods pdf close;

*output to pdf;
ods pdf file="bodyfatexampletriceps.pdf";
*get SAS to give nested F-test;
title 'Full mode vs only Triceps';
proc reg data=bodyfat;
   model y=x1 x2 x3;   
   test x2=0,x3=0;
run;
ods pdf close;

*output to pdf;
ods pdf file="bodyfatexampleselection.pdf";
*Use some standard variable selection methods on the data;
title 'Variable Selection Methods on Bodyfat Example';
proc reg data=bodyfat plots=none;
    model y=x1 x2 x3/selection=cp ;
    model y=x1 x2 x3/selection=forward SLentry=0.3;
    model y=x1 x2 x3/selection=backward SLstay=0.1;
	model y=x1 x2 x3/selection=adjrsq;
run;
ods pdf close;
  
*output to pdf;
ods pdf file="bodyfatexampletypeI.pdf";
*Request type I sums of squares, useful in model building;
title 'Sequential tests for bodyfat example';
proc reg data=bodyfat;
   model y=x1 x3 x2/ss1; *Note the order;   
run;
ods pdf close;

*output to pdf;
ods pdf file="bodyfatexampletypeIglm.pdf";
*Use glm to fit model as it give p-values for type I sums of squares;
title 'Sequential tests for bodyfat example using GLM';
proc glm data=bodyfat;
   model y=x1 x3 x2;   
run;
ods pdf close;