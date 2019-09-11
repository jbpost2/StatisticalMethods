***************************************************
**File to analyze the Test Grade data
**Used in MLR section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data test;
input IQ TIME GRADE ;
datalines;
105  10  75
110  12  79
120  6  68 
116  13  85
122  16  91
130  8  79 
114  20  98
102  15  76
;

*Create interaction variable for use in proc reg (glm will automatically do this);
data test;
set test;
TI = Time*IQ;
run;

*Fit interaction model in proc reg;
proc reg data=test;
model Grade = IQ Time TI;
run;

*Fit interaction model in glm;
proc glm data=test;
*Note: | gives all main effects and interactions;
model Grade=IQ|Time;
run;
*opposite order for type I SS;
proc glm data=test;
model Grade=Time|IQ;
run;
