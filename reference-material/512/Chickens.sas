***************************************************
**File to analyze the chicken diet data
**Used in MLR section notes
**Justin Post - Spring 2015
**************************************************;

*Read in data;
data chickens;
input gain protein diet $;
datalines;
1000.29	21.8	Diet1
953.86	21.8	Diet1
908.72	21.8	Diet1
978.42	21.8	Diet1
992.15	21.8	Diet1
1052.55	21.8	Diet1
959.02	21.8	Diet1
957.01	21.8	Diet1
980.9	21.8	Diet1
1074.32	21.8	Diet1
988.82	21.8	Diet1
1070.14	21.8	Diet1
1002.66	21.8	Diet1
977.65	21.8	Diet1
939.84	21.8	Diet1
1038.07	21.8	Diet1
1023.03	21.8	Diet1
1010.08	21.8	Diet1
954.85	23.5	Diet2
993.62	23.5	Diet2
997.24	23.5	Diet2
1015.64	23.5	Diet2
977.75	23.5	Diet2
945.68	23.5	Diet2
975.22	23.5	Diet2
1030.42	23.5	Diet2
1037.22	23.5	Diet2
993.11	23.5	Diet2
951.68	23.5	Diet2
1048.55	23.5	Diet2
1038.61	23.5	Diet2
985.91	23.5	Diet2
982.81	23.5	Diet2
995.98	23.5	Diet2
1070.75	23.5	Diet2
1014.95	23.5	Diet2
1038.26	25.2	Diet3
1037.03	25.2	Diet3
1051.02	25.2	Diet3
970.43	25.2	Diet3
1022.01	25.2	Diet3
1031.67	25.2	Diet3
1044.9	25.2	Diet3
989.92	25.2	Diet3
1021.02	25.2	Diet3
1082.18	25.2	Diet3
1032.19	25.2	Diet3
1018.14	25.2	Diet3
948.7	25.2	Diet3
1115.16	25.2	Diet3
1039.83	25.2	Diet3
1018.28	25.2	Diet3
1002.67	25.2	Diet3
1000.48	25.2	Diet3
1034.89	26.9	Diet4
1057.93	26.9	Diet4
1096.11	26.9	Diet4
1100.31	26.9	Diet4
1045.67	26.9	Diet4
1042.2	26.9	Diet4
1045.46	26.9	Diet4
1124.92	26.9	Diet4
1061.01	26.9	Diet4
1062.95	26.9	Diet4
988.68	26.9	Diet4
1074.18	26.9	Diet4
1004.11	26.9	Diet4
1067.24	26.9	Diet4
996.47	26.9	Diet4
1060.86	26.9	Diet4
1097.04	26.9	Diet4
1047.27	26.9	Diet4
;


*Fit One-way factorial effects model in glm;
proc glm data=chickens;
class diet;
model gain=diet;
run;

*Treat diet as a continuous and fit the equivalent cubic model;
proc glm data=chickens;
model gain=protein protein*protein protein*protein*protein;
run;

*Obtain the contrasts corresponding to the coefficients in the MLR model;
proc glm data=chickens;
class diet;
model gain=diet;
contrast 'linear' diet -3 -1 1 3;
contrast 'quadratic' diet 1 -1 -1 1;
contrast 'cubic' diet -1 3 -3 1;
run;
