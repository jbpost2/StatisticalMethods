***************************************************
**File to analyze the corn data
**Used in extra problems 
**Justin Post - Spring 2015
**************************************************;

*read in data;
data corn;
   input yield rain;
   datalines;
24.5 9.6
33.7 12.9
27.9 9.9
27.5 8.7
21.7 6.8
31.9 12.5
36.8 13
29.9 10.1
30.2 10.1
32.0 10.1
34.0 10.8
19.4 7.8
36.0 16.2
30.2 14.1
32.4 10.6
36.4 10
36.9 11.5
31.5 13.6
30.5 12.1
32.3 12
34.9 9.3
30.1 7.7
36.9 11
26.8 6.9
30.5 9.5
33.3 16.5
29.7 9.3
35.0 9.4
29.9 8.7
35.2 9.5
38.3 11.6
35.2 12.1
35.5 8
36.7 10.7
26.8 13.9
38.0 11.3
31.7 11.6
32.6 10.4
. 14
;
run;


proc corr data=corn fisher(biasadj=NO) cov;
var yield rain;
run;

ods graphics on;
proc reg data=corn;
model yield=rain/covb clb clm cli;
run;
ods graphics off;


proc reg data=corn;
model yield= rain rain2/ss1;
run;


proc reg data=corn;
model yield= rain rain2/ss1;
test rain2=0;
run;