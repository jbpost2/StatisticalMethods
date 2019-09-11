data tomato;
input Variety $ Density Yield;
datalines;
1 10 7.9
1 10 9.2
1 10 10.5
2 10 8.1
2 10 8.6
2 10 10.1
3 10 15.3
3 10 16.1
3 10 17.5
1 20 11.2
1 20 12.8
1 20 13.3
2 20 11.5
2 20 12.7
2 20 13.7
3 20 16.6
3 20 18.5
3 20 19.2
1 30 12.1
1 30 12.6
1 30 14.0
2 30 13.7
2 30 14.4
2 30 15.4
3 30 18.0
3 30 20.8
3 30 21.0
1 40 9.1
1 40 10.8
1 40 12.5
2 40 11.3
2 40 12.5
2 40 14.5
3 40 17.2
3 40 18.4
3 40 18.9
;

proc glm data=tomato;
class variety density;
model Yield=Variety|Density;
lsmeans Variety Density/adjust=tukey cl; *adjust=tukey tells sas to do pdiff;
run;
