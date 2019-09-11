************************************************************
**Program to find standard normal probabilities for Bottle example in class
**Justin Post - Fall 2014 (some of this program modified from http://www.stat.sc.edu/~hitchcock/sas_normal_prob_examp.txt
***********************************************************;

* The command PROBNORM computes normal probabilities.
It computes the probability that a standard normal RV is less than (or equal to) 
a certain value.  So SAS gives us P(Z < value);

* Let's answer the following questions which were given in class - Y\sim N(16,1)
1. What is the probability a randomly selected bottle will have more than 17.5 hours?
2. What is the probability a randomly selected bottle will have between 15.2 and 16 ounces?
3. What is the probability a randomly selected bottle will have less than 15 ounces?;

*for 1, we standardize to get
P(Y>17.5)=P((Y-16)/1>(17.5-16)/1)=P(Z>1.5)=1-P(Z<1.5)
*for 2, we get
P(15.2<Y<16)=P((15.2-16)/1<Z<(16-16)/1)=P(-0.8<Z<0) = P(Z<0)-P(Z<-0.8)
*for 3, we get
P(Y<15) = P(Z<-1);

*Now we can create a dataset that will hold the answers;
data normanswers;
prob1 = 1 - probnorm(1.5);
prob2 = probnorm(0)-probnorm(-0.8);
prob3 = probnorm(-1);
run;

proc print data=normanswers;
title 'Normal Probabilities';
run;




*We can also find percentiles using SAS.
The probit function will do this for us;

* Let's answer the following questions which were given in class - Z~N(0,1)
1. What is the 97.5th percentile of Z (also called the 0.975 quantile)?
2. What is the 2.5th percentile of Z (also called the 0.025 quantile)?
If Y~N(100,9)
3. What is the 97.5th percentile of Y (also called the 0.975 quantile)?
4. What is the 2.5th percentile of Y (also called the 0.025 quantile)?;


data normanswers2;
percentile1 = probit(0.975);
percentile2 = probit(0.025);
percentile3 = 100+sqrt(9)*probit(0.975);
percentile4 = 100+sqrt(9)*probit(0.025);
run;

proc print data=normanswers2;
title 'Normal Probabilities';
run;
