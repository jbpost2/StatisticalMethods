***************************************************
**File to analyze the milk data
**Used in mixed models section notes
**Justin Post - Spring 2015
**************************************************;

*read in data;
data milkexp;
   infile "milk.dat" firstobs=4;
   input sample lab y;
   ly=log(y);
run;

*basic analysis in glm (incorrect tests);
proc glm;
   class lab sample;
   model ly=sample|lab;
   random sample lab sample*lab;
run;

*output correct tests;
proc glm;
   class lab sample;
   model ly=sample|lab;
   random sample lab sample*lab;
   test h=lab sample e=sample*lab;
run;

*better proc to use;
proc mixed method=type3;
   class lab sample;
   model ly=;
   random sample|lab;
run;

*get ci for mean;
proc mixed cl method=type3; 
   class sample lab;
   model ly=/ddfm=satterth cl;
   random sample|lab;
run;

