***************************************************
**File to analyze the log(biodiesel) and biomass data
**Used in Correlation and SLR section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data bioexp;
*Remember, categorical variables need to have a $ after their name;
input Rep $	Growth Media $ vis	biomass	glycerol Biodiesel @@;
datalines;
1		48		Glu		42.595	9.05	0.36	1.781146271
2		48		Glu		42.171	8.25	2.38	1.903076905
3		48		Glu		42.128	7.15	2.68	1.966478869
4		48		Glu		40.401	6.35	1.32	1.57526476
5		48		Glu		40.0395	4.1		0.1		3.522089192
1		48		Oil		36.33	13.9	74.32	16.14120806
2		48		Oil		35.7185	14.7	63.22	14.27422702
3		48		Oil		38.645	13.05	42.28	26.51572735
4		48		Oil		31.4175	13.1	1.54	1.385518648
5		48		Oil		31.4855	8.1		0.66	0.868206068
1		48		GluOil	37.9465	17.95	25.82	18.67940404
2		48		GluOil	37.621	17.35	17.94	21.30758849
3		48		GluOil	37.079	15		20.36	10.15734556
4		48		GluOil	34.5915	14.8	51.54	48.34330234
5		48		GluOil	31.62	10.4	10.62	4.911549027
1		72		Glu		38.532	8.15	11.22	18.4246367
2		72		Glu		36.8155	7.65	15.08	24.40353069
3		72		Glu		36.189	6.05	9.2		27.51702957
4		72		Glu		39.0495	7.85	0.16	2.000537139
5		72		Glu		39.9595	2.45	0.58	1.953501938
1		72		Oil		33.521	13.45	75.34	26.00586909
2		72		Oil		31.06	14.95	85.68	52.28318163
3		72		Oil		27.899	13.55	99.52	60.28708354
4		72		Oil		36.2115	12.9	1.1		2.60721722
5		72		Oil		37.874	8.85	0.94	2.37217257
1		72		GluOil	29.398	16		53.74	67.07183172
2		72		GluOil	28.904	15.3	59.1	96.23828218
3		72		GluOil	29.7515	15.45	49.44	73.71603225
4		72		GluOil	32.458	15.55	29.8	20.21991588
5		72		GluOil	32.517	12.35	1.02	2.22109276
1		90		Glu		44.337	6.5		1.74	4.810848372
2		90		Glu		37.87	7.65	11.02	9.217542741
3		90		Glu		38.275	6.35	10.9	27.78889206
4		90		Glu		39.6655	5.8		0.5		12.49320759
5		90		Glu		39.7835	5.25	14.16	2.165841394
1		90		Oil		30.9785	14.9	56.46	50.99696175
3		90		Oil		30.5735	10.9	32.98	44.04132938
4		90		Oil		38.773	10.5	47.74	45.30579275
5		90		Oil		38.379	7.9		1.8		5.408238571
1		90		GluOil	33.3595	15.45	19.88	40.28097801
2		90		GluOil	34.0225	15.25	22.82	39.09433035
3		90		GluOil	33.985	13.05	21.98	39.2363402
4		90		GluOil	32.586	12.25	31.24	32.90290389
5		90		GluOil	35.4224	10.8	36.42	24.61923182
;


*Add in log variables;
data bioexp;
set bioexp;
logBiomass = log(Biomass);
logBiodiesel = log(Biodiesel);
itself=1;
run;

*Print out data to be analyzed;
proc print data=bioexp;
var logBiodiesel biomass;
run;

*Create Histograms;
title 'Histogram of Biomass and Log(Biodiesel)';
proc univariate data=bioexp;
var Biomass logBiodiesel;
histogram;
run; 

*Create Boxplots;
title 'Box Plot of Biomass and Log(Biodiesel)';
proc boxplot data=bioexp;
   plot Biomass*itself;
      inset min mean max stddev /
      header = 'Overall Statistics'
      pos    = tm;
   plot logBiodiesel*itself;
   inset min mean max stddev /
      header = 'Overall Statistics'
      pos    = tm;
run;

*Create scatter plot;
title 'Scatter Plot of Biomass and Log(Biodiesel)';
proc sgplot data=bioexp;
 scatter x=Biomass y=logBiodiesel;
run;

*Send output to pdf file;
ods pdf file="corrbiodiesel.pdf";
*Correlation analysis;
title 'Output From Proc Corr for Biomass and Log(Biodiesel) Example';
proc corr data=bioexp cov fisher(BIASADJ=NO);
var biomass logbiodiesel;
run;
quit;
*Close output to pdf;
ods pdf close;

*Send output to pdf file;
ods pdf file="slrbiodiesel.pdf";
*SLR analysis;
title 'Output From Proc Reg for Biomass and Log(Biodiesel) Example';
proc reg data=bioexp ;
model logbiodiesel=biomass/clb;
run;
quit;
*Close output to pdf;
ods pdf close;


*Add in new value to get prediction and confidence interval for;
data newbiomass;
input biomass logbiodiesel;
datalines;
12 .
;

*append new data set to old one;
proc datasets;
append base=bioexp data=newbiomass;
run;

*Rerun SLR analysis with intervals;
proc reg data=bioexp ;
model logbiodiesel=biomass/clb r clm cli;
run;
quit;
