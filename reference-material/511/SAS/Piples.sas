************************************************************
**Program to find chi-square and f critical values and probabilities
**Justin Post - Fall 2014 
***********************************************************;

*Syntax     PROBCHI(x,df)        P(Chi^2_df <x) = returned value
The The PROBCHI function returns the probability that an observation from a chi-square distribution, with degrees of freedom df
is less than or equal to x. This function accepts a noninteger degrees of freedom parameter df if needed);

*Syntax     QUANTILE(dist, probability, parm-1,...,parm-k)       P(dist<= value returned) = probability 
The QUANTILE function computes the probability from various continuous and discrete distributions
`probability' is a numeric constant, variable, or expression that specifies the value of a random variable.
parm-1,...,parm-k are optional shape, location, or scale parameters appropriate for the specific distribution.;


*Find some probabilities and quantile values from a chi-square;
data chisq;
prob1 = probchi(2,2); *Probability chi-sq 2 is less than its mean --- P(Chi^2_2<2);
prob2 = probchi(12.8,4); *P(Chi^2_4<12.8);

quant1 = quantile('chisq',0.95,11); *0.95 quantile from a chi^2_11;
quant2 = quantile('chisq',0.99,15); *0.99 quantile from a chi^2_15;
run;

proc print data=chisq;
title 'Chi-Square values';
run;




*Syntax    PROBF(x,ndf,ddf)    P(F_df1,df2<x) = returned value
The PROBF function returns the probability that an observation from an F distribution, 
with numerator degrees of freedom ndf (our df1) and denominator degrees of freedom ddf (our df2)
is less than or equal to x. 

*Find some probabilities and quantile values from an F distribution;
data f;
prob1 = probf(10,4,2); *Probability F_4,2 is less than 10 --- P(F_4,2<10);
prob2 = 1-probf(22,3,18); *P(F_3,18>22);

quant1 = quantile('f',0.95,4,2); *0.95 quantile from an F_4,2;
quant2 = quantile('f',0.99,3,18); *0.99 quantile from an F_3,18;
run;

proc print data=chisq;
title 'F values';
run;
