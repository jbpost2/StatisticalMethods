data milkexp;
   infile "milk.dat" firstobs=4;
   input sample lab y;
   ly=log(y);
run;

proc glm;
   class lab sample;
   model ly=sample|lab;
   random sample lab sample*lab;
run;

proc glm;
   class lab sample;
   model ly=sample|lab;
   random sample lab sample*lab;
   test h=lab sample e=sample*lab;
run;

proc mixed method=type3;
   class lab sample;
   model ly=;
   random sample|lab;
run;


proc mixed cl method=type3; 
   class sample lab;
   model ly=/ddfm=satterth cl;
   random sample|lab;
run;

