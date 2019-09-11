***************************************************
**File to analyze height data
**Used in extra questions
**Justin Post - Spring 2015
**************************************************;

#read in data via matrix;
data Galton;
 array cdata(14);
  if _n_ = 1 then input cdata1-cdata14 @ ;
  retain cdata1-cdata14;  drop cdata1-cdata14 i;
  input parent @;
    do i = 1 to 14; input count @ ; son=cdata(i);
   output;  end;
datalines;
    61.7 62.2 63.2 64.2 65.2 66.2 67.2 68.2 69.2 70.2 71.2 72.2 73.2 73.7
73.0  0    0    0    0    0    0    0    0    0    0    0    1    3    0
72.5  0    0    0    0    0    0    0    1    2    1    2    7    2    4
71.5  0    0    0    0    1    3    4    3    5   10    4    9    2    2
70.5  1    0    1    0    1    1    3   12   18   14    7    4    3    3
69.5  0    0    1   16    4   17   27   20   33   25   20   11    4    5
68.5  1    0    7   11   16   25   31   34   48   21   18    4    3    0
67.5  0    3    5   14   15   36   38   28   38   19   11    4    0    0
66.5  0    3    3    5    2   17   17   14   13    4    0    0    0    0
65.5  1    0    9    5    7   11   11    7    7    5    2    1    0    0
64.5  1    1    4    4    1    5    5    0    2    0    0    0    0    0
64.0  1    0    2    4    1    2    2    1    1    0    0    0    0    0
 ;


data big;
set galton;
drop j count;
do j=1 to count;
output; 
end;

data questions;
   /* these values used for prediction or estimation at x=68,x=72 */
   input parent son;
   cards;
   68 .
   72 .
;
run;

ods pdf file="Galton.pdf";
proc corr data=big fisher(biasadj=NO) cov;
var son parent;
run;

data big;
   set big questions;
run;

ods graphics on;
proc reg; 
   model son=parent/clb;
   output out=out1 residual=r p=yhat ucl=pihigh lcl=pilow uclm=cihigh lclm=cilow
   stdp=stdmean;
   run;

data questions; set out1;
   if son=.;

proc print;
   title "questions regarding prediction, estimation when x=68, x=72";
run;
ods pdf close;