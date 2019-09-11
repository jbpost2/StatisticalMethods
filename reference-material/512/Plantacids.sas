***************************************************
**File to analyze the plant acid data
**Used in mixed models section notes
**Justin Post - Spring 2015
**************************************************;

*read data from file;
data plantacid;
infile "plantacids.dat";
input y plant leaf rep;
run;

*analyze model with ci for the mean;
proc mixed method=type3 cl;
class plant leaf;
model y=/cl;
random plant leaf(plant);
run;



