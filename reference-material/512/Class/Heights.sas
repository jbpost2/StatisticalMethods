data plantheight;
input Treatment Pot Seedling Height;
datalines;
1 1 1 32.94 
1 1 2 35.98
1 2 1 34.76 
1 2 2 32.40
2 1 1 30.55 
2 1 2 32.64
2 2 1 32.37 
2 2 2 32.04
3 1 1 31.23 
3 1 2 31.09
3 2 1 30.62 
3 2 2 30.42
4 1 1 34.41 
4 1 2 34.88
4 2 1 34.07 
4 2 2 33.87
5 1 1 35.61 
5 1 2 35.00
5 2 1 33.65 
5 2 2 32.91
;


proc mixed data=plantheight method=type3;
class treatment pot;
model height=treatment;
random pot(treatment);
lsmeans treatment/adjust=tukey cl;
run;







