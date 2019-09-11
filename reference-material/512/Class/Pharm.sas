*Pharm. data;
data pharm;
input contam Company $;
datalines;
255 Cutter
105 Abbott
577 McGaw
264 Cutter
288 Abbott
515 McGaw
342 Cutter
98 Abbott
214 McGaw
331 Cutter
275 Abbott
413 McGaw
234 Cutter
221 Abbott
401 McGaw
217 Cutter
240 Abbott
260 McGaw
;
title '';

proc glm data=pharm;
class company;
model contam=company;
lsmeans company;
contrast 'McGaw vs Abbot' company -1 0 1;
estimate 'McGaw vs Abbot'  company -1 0 1;
contrast 'Cutter vs avg of McGaw and Abbot' company -1 2 -1;
estimate 'Cutter vs avg of McGaw and Abbot' company -1 2 -1/divisor=2;
run;


