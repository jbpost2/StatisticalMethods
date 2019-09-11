***************************************************
**File to analyze the cholesterol data on age and gender
**Used in multiway ANOVA section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data cholesterol;
input Gender $ Age $ Treatment $ Chol;
datalines;
Female Young YF 221 
Female Young YF 213 
Female Young YF 202 
Female Young YF 183 
Female Young YF 185 
Female Young YF 197 
Female Young YF 162  
Male Young YM 271 
Male Young YM 192 
Male Young YM 189 
Male Young YM 209 
Male Young YM 227 
Male Young YM 236 
Male Young YM 142 
Female Old OF 262 
Female Old OF 193 
Female Old OF 224 
Female Old OF 201 
Female Old OF 161 
Female Old OF 178 
Female Old OF 265
Male Old OM 192 
Male Old OM 253 
Male Old OM 248 
Male Old OM 278 
Male Old OM 232 
Male Old OM 267 
Male Old OM 289
; 

*Run glm and get all pairwise differences of lsmeans;
proc glm data=cholesterol;
class Treatment;
model Chol=Treatment;
lsmeans Treatment/cl pdiff adjust=tukey;
run;

*Obtain contrasts corresponding to main effects and interaction effects of two-way anova model;
proc glm data=cholesterol;
class Treatment;
model Chol=Treatment;
contrast 'Age Main Effect Contrast' intercept 0 treatment 0.5 0.5 -0.5 -0.5;
contrast 'Gender Main Effect Contrast' intercept 0 treatment 0.5 -0.5 0.5 -0.5;
contrast 'Age*Gender Interaction Effect Contrast' intercept 0 treatment 0.5 -0.5 -0.5 0.5;
estimate 'Age Main Effect Estimate' intercept 0 treatment 0.5 0.5 -0.5 -0.5;
estimate 'Gender Main Effect Estimate' intercept 0 treatment 0.5 -0.5 0.5 -0.5;
estimate 'Age*Gender Interaction Effect Estimate' intercept 0 treatment 0.5 -0.5 -0.5 0.5;
run;

*Fit two-way ANOVA model instead;
proc glm data=cholesterol;
class Age Gender;
model Chol=Age Gender Age*Gender;
contrast 'Age Main Effect Contrast' intercept 0 Age 1 -1;
contrast 'Gender Main Effect Contrast' intercept 0 Age 0 0 Gender 1 -1;
contrast 'Age*Gender Interaction Effect Contrast' intercept 0 Age 0 0 Gender 0 0 Age*Gender 0.5 -0.5 -0.5 0.5;
estimate 'Age Main Effect Estimate' intercept 0 Age 1 -1;
estimate 'Gender Main Effect Estimate' intercept 0 Age 0 0 Gender 1 -1;
estimate 'Age*Gender Interaction Effect Estimate' intercept 0 Age 0 0 Gender 0 0 Age*Gender 0.5 -0.5 -0.5 0.5;
run;


*Test all three effects at once (equivalent to global F-test);
proc glm data=cholesterol;
class Age Gender;
model Chol=Age Gender Age*Gender;
contrast 'All three at once' intercept 0 Age 1 -1,
 intercept 0 Age 0 0 Gender 1 -1,
 intercept 0 Age 0 0 Gender 0 0 Age*Gender 0.5 -0.5 -0.5 0.5;
run;
