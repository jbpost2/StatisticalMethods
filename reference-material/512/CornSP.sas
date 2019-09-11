***************************************************
**File to analyze the corn split plot data
**Used in split plot section notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data cornsp;
input pest $ plot $ irr $ yield irr2 $ cult$ farm $ plot2 $;
datalines;
1 1 1 53.4 no 1 2 1
1 1 2 53.8 no 2 2 1
1 1 3 58.2 yes 1 2 1
1 1 4 59.5 yes 2 2 1
1 2 1 46.5 no 1 1 2
1 2 2 51.1 no 2 1 2
1 2 3 49.2  yes 1 1 2
1 2 4 51.3 yes 2 1 2
2 1 1 54.3 no 1 1 3 
2 1 2 56.3  no 2 1 3
2 1 3 60.4  yes 1 1 3
2 1 4 64.5 yes 2 1 3
2 2 1 57.2 no 1 2 4
2 2 2 56.9 no 2 2 4
2 2 3 61.6 yes 1 2 4
2 2 4 66.8 yes 2 2 4
3 1 1 55.9 no 1 2 5
3 1 2 58.6 no 2 2   5
3 1 3 62.4 yes 1 2 5
3 1 4 64.5 yes 2 2 5
3 2 1 57.4 no 1 1 6
3 2 2 60.2 no 2 1 6
3 2 3 57.2 yes 1 1 6
3 2 4 62.7 yes 2 1 6
;

*analyze in mixed;
proc mixed data=cornsp method=type3;
class pest plot irr;
model yield = pest|irr/ddfm=satterthwaite;
random plot(pest);
lsmeans irr/adjust=tukey cl;
*lsmeans trt|pest/adjust=tukey cl;  /* if there were interaction */
run;


proc mixed data=cornsp method=type3;
class pest plot irr2 cult;
model yield = pest|irr2|cult/ddfm=satterthwaite;
random plot(pest);
lsmeans irr2 cult/adjust=tukey cl;
run;


proc mixed data=cornsp method=type3;
class pest farm irr2 cult;
model yield = pest|irr2|cult;
random farm farm*pest;
run;
