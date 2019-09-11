*******************************************************************
**Chapter 6 SAS examples (two-sample t-tests)
**Justin Post - Fall 14
*******************************************************************;


*******************************************************************
**Auto repair example - in the notes this was our paired t-test example
*******************************************************************;

*read in the data;
data autodata;
input Jocko Jami;
datalines;
450 255
699 720
670 499
800 760
401 225
1000 700
535 300
680 350
1100 1000
850 770
;

*print it out to make sure it read in correctly;
proc print data=autodata;
run;

*find the summary statistics for each variable and create histograms;
proc univariate data=autodata;
var Jocko Jami;
histogram;
run;

*add in differences;
*name new data set;
data autodata;
*tell SAS to start with autodata as the data set;
set autodata;
*create a new variable;
diff=Jocko-Jami;
run;

*print data to make sure we created the differences correctly;
proc print data=autodata;
run;

*Check out the summary stats of the differences;
proc univariate data=autodata;
var diff;
histogram;
run;

*Conduct the paired t-test in SAS;
proc ttest data=autodata;
paired Jocko*Jami;
run;
/* About this code:
The PAIRED VAR1*VAR2 statement requests the paired t-test.
SAS calculates the differences as VAR1-VAR2.
*/



*******************************************************************
**Weight example - in the notes this was our second paired t-test example
*******************************************************************;
data weight;
input initial final;
datalines;
 180 165
 142 138
 126 128
 138 136
 175 170
 205 197
 116 115
 142 128
 157 144
 136 130
 ;

 *Check that data read in correctly;
 proc print data=weight;
 run;

 *In order to get univariate stats on the difference, create a new data set as in previous example;
 data weight;
*tell SAS to start with weightdata as the data set;
set weight;
*create a new variable;
FminusI=Final-Initial;
run;

*Find summary stats on the differences;
proc univariate data=weight;
var FminusI;
histogram;
run;

*Conduct paired t-test;
proc ttest data=weight;
paired Final*Initial;
run;


*******************************************************************
**Cat food example - in the notes this was our two-sample t-test 
**where equal variance of our populations is assumed
*******************************************************************;
data catfood;
input Tenn Wisc;
datalines;
4.67 4.74
4.65 4.65
4.68 4.60
4.59 4.62
4.64 4.67
4.56 4.72
4.54 4.67
4.81 4.70
4.72 4.61
4.51 4.63
4.63 4.57
4.59 4.68
4.60 4.58
4.57 4.66
4.62 4.54
4.7  4.64
4.62 4.54
4.69 4.62
4.61 4.59
4.67 4.71
4.60 4.70
4.63 4.52
4.66 4.62
;

*Make the difference so we can find the summary stats on that;
data catfood;
set catfood;
Tenn_Wisc = Tenn-Wisc;
run;

*Find the summary stats on the difference (note this is nonsense here since the data are not paired);
proc univariate data=catfood;
var Tenn_Wisc;
histogram;
run;

*Find the stats for each variable;
proc univariate data=catfood;
var Tenn Wisc;
histogram;
run;

*In order to run the two-sample t-test in SAS we need to read the data in under a different form;

data catfood2;
input weight location $;
datalines;
	4.67 Tenn
	4.65 Tenn
	4.68 Tenn
	4.59 Tenn
	4.64 Tenn
	4.56 Tenn
	4.54 Tenn
	4.81 Tenn
	4.72 Tenn
	4.51 Tenn
	4.63 Tenn
	4.59 Tenn
	4.60 Tenn
	4.57 Tenn
	4.62 Tenn
	4.7 Tenn
	4.62 Tenn
	4.69 Tenn
	4.61 Tenn
	4.67 Tenn
	4.60 Tenn
	4.63 Tenn
	4.66 Tenn
	4.74 Wisc
	4.65 Wisc
	4.60 Wisc
	4.62 Wisc
	4.67 Wisc
	4.72 Wisc
	4.67 Wisc
	4.70 Wisc
	4.62 Wisc
	4.63 Wisc
	4.57 Wisc
	4.68 Wisc
	4.58 Wisc
	4.66 Wisc
	4.54 Wisc
	4.64 Wisc
	4.54 Wisc
	4.62 Wisc
	4.59 Wisc
	4.71 Wisc
	4.70 Wisc
	4.52 Wisc
	4.62 Wisc
	;

*with the data in this form we can apply the ttest procedure to do the two-sample t-test on our data;
proc ttest data=catfood2;
*Specify that the location variable is categorical;
class location;
*variable that we want to conduct our test on;
var weight;
run;




*******************************************************************
**Heartrate example - in the notes this was our 2nd two-sample t-test 
**where equal variance of our populations is not assumed
*******************************************************************;
data heartrate;
*variables to be inputted, $ after a variable means it is categorical;
input rate group $;
datalines;
141.42 1
168.73 1
141.46 1
160.35 1
152.42 1
141.14 1
153.33 1
144.25 1
132.07 1
135.97 1
171.91 1
143.99 1
145.09 1
149.97 1
171.20 1
129.21 2
133.51 2
141.56 2
138.13 2
130.03 2
148.18 2
148.79 2
152.74 2
132.13 2
156.73 2
;

*analyze data with proc ttest;
proc ttest data=heartrate;
*denote group as a categorical variable;
class group;
var rate;
run;
