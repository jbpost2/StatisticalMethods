options ls=95 nodate nocenter formdlim="+" mstored sasmstore=research;
options ps=10000;

%let nocrp=nocolumn norow nopercent;

libname research "/home/jaosborn/research";

symbol value=dot;

data one;
   array wvec{17} $15 ("Injury","Primrose","Cspurry","Henbit","Filago","Violet","Dand","Geran","Chick","Cud","Horse","LQ","Poa","DogFennel","LivAmaranth","PinkPursl","Eclipta");
   infile "sheet1.csv" dsd firstobs=2;
   sheet=1;
   input Year Location Treatment Replicate Week @;
   do i=1 to 17 ;
      input pctcover @;
      weed=wvec{i};
      output;
   end;
   drop wvec1-wvec17;
run;
/*
proc print data=one (obs=5);
   where weed="Primrose" and year=2017;
run;
data two;
   infile "sheet2.csv" dsd firstobs=2;
   input Year Location Treatment Replicate Week Injury Primrose Cspurry Henbit Filago Violet Dand Geran Chick Cud Horse LQ Poa DogFennel LivAmaranth PinkPursl Eclipta Cress Carrot Toadflax;
   sheet=2;
run;
 
data three;
   infile "sheet3.csv" dsd firstobs=2;
   input Year Location Treatment Replicate Week Injury Primrose Cspurry Henbit Filago Violet Dand Geran Chick Cud Horse LQ Poa DogFennel LivAmaranth PinkPursl Eclipta Cress Carrot;
   sheet=3;
run;
*/
/*
data all3;
   set one two three;
run;*/
proc sort data=one;
   by weed year;
run;

ods trace on;
ods listing close;

proc mixed data=one method=type3;
   *where weed="Primrose" and year=2017 and treatment ne 5;
   where treatment ne 5;
   by weed year;
   class year location week treatment replicate ;
   model pctcover=treatment|week / outp=residz;
   random replicate replicate*treatment; 
   lsmeans treatment*week/slice=week;
   ods output slices=ourslices lsmeans=lsm tests3=t3 covparms=varcomps;
run;
ods listing ;
proc print data=varcomps; title "varcomps";run;
proc print data=t3; title "t3";run;
proc print data=ourslices; title "ourslices";run;
proc print data=lsm; title "lsm";run;
symbol value=dot;
proc gplot data=residz;
   by weed year;
   plot resid*pred=treatment;
run;
