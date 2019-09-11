data plantacid;
infile "plantacids.dat";
input y plant leaf rep;
run;

proc mixed method=type3 cl;
class plant leaf;
model y=/cl;
random plant leaf(plant);
run;



