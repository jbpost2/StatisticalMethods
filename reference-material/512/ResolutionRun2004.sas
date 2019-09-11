***************************************************
**File to analyze the Resolution Run data
**Used in MLR and GLM section notes
**Justin Post - Spring 2015
**************************************************;

/*                     THIRD ANNUAL RESOLUTION RUN
                       5 KILOMETER ROAD RACE
             TAC Certified.  Registration No. NC-01009-PH
      Raleigh, North Carolina     January 1, 2004  10:00 A.M.   
			Sunny, 40's  light breeze

These data, downloaded from a website, are in columns Column pointers can be used to direct input of variables. 
For example, the variable NAME is a character string to be read from the 7th through the 30th column (or field). 

The $ symbol indicates that the variable to be input is a character string. 
*/

*Read in data;
data running;  /* ITEM #1 */
   input PLACE NAME $ 7-30 age sex $ CITY $ 41-55 ST $ 57-58 cRace $ 62-66 cPACE $ 68-72;
   if age>.;    /* delete observations for whom age is missing */
   cards;
    1 Dave Max                     28 M Goldsboro       NC   16:41  5:23 
    2 MARCELLIN LITTLE             39 M WAKE FOREST     NC   16:57  5:28 
    3 TIM LEINBACH                 41 M NEW YORK        NY   17:08  5:31 
    4 Jack Morgan                  42 M Pittsboro       NC   17:24  5:37 
    5 GREG RICHARDSON              40 M DURHAM          NC   18:25  5:56 
    6 AARON KIEFER                 23 M CHAPEL HILL     NC   18:36  6:00 
    7 Paul Potorti                 40 M Apex            NC   18:41  6:01 
    8 Tom Cronley                  42 M Durham          NC   18:49  6:04 
    9 EDWIN BARRY                  28 M RALEIGH         NC   18:52  6:05 
   10 MIKE TARRANT                 18 M RALEIGH         NC   19:10  6:11 
   11 Quentin Genke                32 M Greensboro      NC   19:58  6:26 
   12 CHARLES DOUGLAS              32 M RALEIGH         NC   20:27  6:35 
   13 RON STRAND                   52 M ANGIER          NC   20:34  6:37 
   14 JACK UNRUH                   41 M CARY            NC   21:00  6:46 
   15 Edward Pollard               43 M Raleigh         NC   21:01  6:46 
   16 Zeph Putnam                  50 M fuquay varina   NC   21:02  6:47 
   17 JEFF CLEMENT                 17 M CARY            NC   21:19  6:52 
   18 Jerry Brooke                 31 M Apex            NC   21:25  6:54 
   19 SHAWN ARNDT                  17 M BEAVER DAM      WI   21:28  6:55 
   20 DAVID SHINN                  51 M CARY            NC   21:29  6:55 
   21 DUNCAN EXTON                 33 M FUQUAY-VARINA   NC   21:36  6:58 
   22 JOE HERBST                   41 M CARY            NC   21:40  6:59 
   23 Ignacio Pereda               32 M caracas              21:45  7:00 
   24 Ken Pollock                  55 M Raleigh         NC   21:47  7:01 
   25 MEREDITH CROKE               23 F RALEIGH         NC   22:02  7:06 
   26 KEN BROWNDORF                41 M RALEIGH         NC   22:10  7:08 
   27 Jason Osborne                34 M Raleigh         NC   22:11  7:09 
   28 Peter Gamble                 38 M Raleigh         NC   22:17  7:11 
   29 JEFF BRANIN                  56 M MERCHANTVILLE   NJ   22:26  7:14 
   30 TIM STEVENS                  47 M RALEIGH         NC   22:29  7:15 
   31 Brandon Terry                16 M Fayetteville    NC   22:29  7:15 
   32 Ann Wheelan                  26 F Cary            NC   22:33  7:16 
   33 NIC ORRISON                  14 M RALEIGH         NC   22:37  7:17 
   34 Layne Snelling               50 M Cary            NC   22:38  7:17 
   35 MIKE WALSH                   36 M CARY            NC   22:47  7:21 
   36 MARK DOWD                    37 M WAKE FOREST     NC   22:48  7:21 
   37 NEAL BLAIR                   50 M RALEIGH         NC   23:02  7:25 
   38 CHRISTOPHER MOORE            24 M GREENVILLE      NC   23:05  7:26 
   39 keith hines                  40 M goldsboro       NC   23:10  7:28 
   40 Bill Vetter                  42 M Raleigh         NC   23:13  7:29 
   41 DANIEL HASSELL               36 M GREENSBORO      NC   23:23  7:32 
   42 CAITLIN KELLY                10 F APEX            NC   23:28  7:34 
   43 ANDREW HALL                   9 M WILSON          NC   23:32  7:35 
   44 NEAL PARKER                  44 M RALEIGH         NC   23:36  7:36 
   45 robert phillips              32 M apex            NC   23:37  7:36 
   46 ED BROWN                     30 M RALEIGH         NC   23:53  7:42 
   47 William Scoggin              39 M Raleigh         NC   23:53  7:42 
   48 Dennis Daniels               39 M Raleigh         NC   24:00  7:44 
   49 Jim Watts                    54 M Cary            NC   24:05  7:46 
   50 China Chien                  27 F Raleigh         NC   24:08  7:46 
   51 davis gooch                  15 M minneapolis     MN   24:10  7:47 
   52 EMILY PARKER                 15 F RALEIGH         NC   24:12  7:48 
   53 MICHAEL LUISI                38 M PORTCHESTER     NY   24:12  7:48 
   54 allen gooch                  48 M minneapolis     MN   24:21  7:51 
   55 Sidney Mitchell              37 M Cary            NC   24:25  7:52 
   56 COLIN DONAHUE                10 M RALEIGH         NC   24:26  7:52 
   57 Paul Wilson                  48 M Cary            NC   24:33  7:54 
   58 Emily Ross                   18 F Raleigh         NC   24:47  7:59 
   59 KARTHIK SUNDARAMOORTHY       29 M RALEIGH         NC   25:03  8:04 
   60 CHAD BOYKIN                  26 M CARY            NC   25:05  8:05 
   61 Erin Schryver                25 F Raleigh         NC   25:06  8:05 
   62 ZACH ORRISON                  9 M RALEIGH         NC   25:20  8:10 
   63 Hunter Credle                32 M durham          NC   25:22  8:10 
   64 Ginny Cronley                14 F Durham          NC   25:28  8:12 
   65 PETER CRANFORD               50 M RALEIGH         NC   25:41  8:17 
   66 JOSEPH COLETTI               32 M CARY            NC   25:44  8:17 
   67 PATRICK DONAHUE              12 M RALEIGH         NC   25:57  8:22 
   68 KEN DONAHUE                  42 M RALEIGH         NC   25:58  8:22 
   69 Jenny Shigley                28 F Raeford         NC   25:58  8:22 
   70 BRITTANY CHRISTIAN           15 F CARY            NC   26:07  8:25 
   71 Joe Wheelan                  51 M Cary            NC   26:12  8:26 
   72 KIM KELLY                    43 F APEX            NC   26:19  8:29 
   73 Victoria Mitchell            11 F Cary            NC   26:21  8:29 
   74 KAJAL DESAI                  24 F RALEIGH         NC   26:25  8:31 
   75 TOM GILLASPY                 39 M RALEIGH         NC   26:27  8:31 
   76 John Aldridge, Jr.           50 M Wake Forest     NC   26:38  8:35 
   77 Donald Davis                 60 M Clayton         NC   26:50  8:39 
   78 Susan Butler                 30 F Greenville      NC   27:08  8:44 
   79 Pete Elbaum                  49 M Henderson       NC   27:18  8:48 
   80 JERRY GREGORY                46 M RALEIGH         NC   27:18  8:48 
   81 JON SASSER                   47 M RALEIGH         NC   27:27  8:51 
   82 VIVIAN COLBERT               40 F RALEIGH         NC   27:28  8:51 
   83 Cheri Taylor                 42 F Cary            NC   27:29  8:51 
   84 Janet Bartz                  23 F Cary            NC   27:39  8:54 
   85 Amy Tunstall                 26 F Henderson       NC   27:41  8:55 
   86 Wayne Bramlett               39 M Garner          NC   28:23  9:09 
   87 JENNIFER CLEMENT             44 F CARY            NC   28:31  9:11 
   88 JAMES FAIRCHILD              40 M MEBANE          NC   28:33  9:12 
   89 Chuck McBride                42 M Raleigh         NC   28:35  9:13 
   90 Renee Carroll                26 F Cedar Grove     NC   28:36  9:13 
   91 RHONDA HAMPTON               43 F WAKE FOREST          28:55  9:19 
   92 MAURA CLEMENT                15 F CARY            NC   28:56  9:19 
   93 MEGAN MCCULLOCH              15 F WAKE FOREST     NC   28:58  9:20 
   94 JOSH KUNESH                  13 M RALEIGH         NC   29:07  9:23 
   95 SHARON KUNESH                41 F RALEIGH         NC   29:08  9:23 
   96 DENISE PARKER                42 F RALEIGH         NC   29:09  9:24 
   97 ROBYN MCCHESNEY              50 F RALEIGH         NC   29:10  9:24 
   98 Kenneth Carper               47 M Raleigh         NC   29:14  9:25 
   99  SAILE                       49 M CARY            NC   29:25  9:29 
  100 JOE CAMERON                  61 M SANFORD         NC   29:31  9:30 
  101 Simon Whysall                54 M Goldsboro       NC   29:34  9:31 
  102 NEAL JONES                   50 M RALEIGH         NC   29:37  9:33 
  103 PAT DEBOER                   50 F RALEIGH         NC   29:40  9:33 
  104 KATIE MCCHESNEY              14 F RALEIGH         NC   29:43  9:34 
  105 KATHY ROWLETT                43 F RALEIGH         NC   29:43  9:34 
  106 HEIDI SLOAN                  41 F RALEIGH         NC   29:45  9:35 
  107 Tammy Brown                  41 F Raleigh         NC   29:48  9:36 
  108 LARRY] BADER                 61 M CARY            NC   29:56  9:39 
  109 EVERETT POORE                44 M RALEIGH         NC   30:05  9:42 
  110 Jami Croteau                 27 F Raleigh         NC   30:06  9:42 
  111 Chris Myers                  36 F Apex            NC   30:08  9:42 
  112 Mike Myers                   35 M Apex            NC   30:08  9:43 
  113 Grace Smiley                 24 F Durham          NC   30:31  9:50 
  114 Del Huntsinger               49 M Raleigh         NC   30:43  9:54 
  115 DARIN KALISAK                34 M CHAPEL HILL     NC   31:00  9:59 
  116 William Pittman              52 M Raleigh         NC   31:33 10:10 
  117 Daniel Carper                15 M Raleigh         NC   31:38 10:11 
  118 LYLE HASSELL                 35 M WINSTON-SALEM   NC   31:47 10:14 
  119 ALLISON HUBBARD              15 F WAKE FOREST     NC   31:53 10:16 
  120 Rich Levine                  38 M Knightdale      NC   31:55 10:17 
  121 Brad Broyles                 38 M Garner          NC   32:10 10:22 
  122 Margaret Crumpler            49 F Raleigh         NC   32:17 10:24 
  123 Jennifer Brooke              31 F Apex            NC   32:57 10:37 
  124 KENYA LANE                   34 F RALEIGH         NC   33:08 10:40 
  125 Caroline Mitchell             9 F Cary            NC   33:12 10:42 
  126 LEXY BADER                    9 F CARY            NC   33:21 10:44 
  127 JAKE PATRICK                  8 M WAKE FOREST     NC   33:32 10:48 
  128 Dale Patrick                 41 M Wake Forest     NC   33:33 10:48 
  129 Susan Patrick                40 F Wake Forest     NC   33:33 10:48 
  130 Kathy Phillips               38 F Durham          NC   33:44 10:52 
  131 SAM BADER                    11 M CARY            NC   33:54 10:55 
  132 PEGGY WARNER                 49 F CARY            NC   33:55 10:55 
  133 CLAIRE CLEMENT               10 F CARY            NC   33:57 10:56 
  134 DAVID CLEMENT                44 M CARY            NC   33:58 10:56 
  135 Deb VanEvery                 50 F Cary            NC   34:10 11:00 
  136 ROBERT PARKER                61 M BENSON          NC   34:38 11:09 
  137 DAVID PARKER                 13 M BENSON          NC   34:41 11:10 
  138 TERRI DOWD                   35 F WAKE FOREST     NC   35:46 11:31 
  139 Cawley Bromley               10 F Cary            NC   36:01 11:36 
  140 Shana McMasters              30 F Creedmoor       NC   36:06 11:38 
  141 SHAWNTEL SECHRIST            28 F RALEIGH         NC   36:09 11:39 
  142 SUSAN O'STEEN                37 F RALEIGH         NC   36:15 11:41 
  143  STEWART                     38 F RALEIGH         NC   36:16 11:41 
  144 CATHY HARRIS-CANNON          49 F RALEIGH         NC   36:21 11:43 
  145 Shanaz Carper                51 F Raleigh         NC   36:52 11:52 
  146 Renee Mitchell               37 F Cary            NC   36:55 11:54 
  147 LUCINDA REYNOLDS              . F RALEIGH         NC   36:56 11:54 
  148 Amy Huntsinger               41 F Raleigh         NC   37:02 11:56 
  149 PHYLLIS WALKER               35 F RALEIGH         NC   37:03 11:56 
  150 IRIS VINEGAR                 76 F RALEIGH         NC   37:03 11:56 
  151 JANEL PARKER                 34 F SMITHFIELD      NC   37:22 12:02 
  152 Rick Bartz                   52 M Raleigh         NC   37:51 12:12 
  153 JEAN HAGEN-JOHNSON           51 F RALEIGH         NC   40:21 13:00 
  154 CATHY STIPE                  46 F RALEIGH         NC   40:21 13:00 
  155 Monica Carper                17 F Raleigh         NC   40:21 13:00 
  156 Robert Bromley               39 M Cary            NC   44:54 14:28 
  157 Madeline Bromley              6 F Cary            NC   44:55 14:28 
  158 BONNIE ARNDT                 52 F BEAVER DAM      WI   46:53 15:06 
  159 Valiree Sanderford           10 F Selma           NC   53:36 17:16 
  160 AMANDA KEYSER                10 F WAKE FOREST     NC   53:37 17:16 
  161 Robert Renfrew               81 M Raleigh         NC   54:19 17:30 
;
run;


*convert times to minutes;
data running;
   set running;
   race=1*scan(crace,1,':')+1/60*scan(crace,2,':');
   pace=1*scan(cpace,1,':')+1/60*scan(cpace,2,':');
* The SCAN command extracts characters from a character string
We might want to do this here to convert the (minutes:seconds)
into just minutes, for plotting and for regression analyses ;
run;

*Print out data of interest;
proc print;
   var sex age age2 pace; 
run;

*Fit simple linear and quadratic models;
proc reg data=running simple; 
   model pace=age;
   model pace=age age2/ss1 clb covb ; 
run;

*Do the same, except use proc reg;
proc glm data=running plots=all; 
   model pace=age age*age ; 
run;

*Add in new age to get CI and PI for;
data running2;
 input age;
datalines;
32.83
;

*append to base data set;
proc datasets;
append base=running data=running2;
run;

*Obtain a CI for the mean of all runners at age 32.83;
proc glm data=running plots=all; 
   model pace=age age*age/inverse clm; 
run;



***************************************************************
*Model comparison from GLM section;

*output to pdf;
ods pdf file='ResRunGLM.pdf';
proc glm;
title 'Model 2';
class sex;
model pace=sex/solution clparm;
run;
proc glm;
title 'Model 3';
model pace=age/solution clparm;
run;
proc glm;
title 'Model 4';
class sex;
model pace=age sex/solution clparm;
run;
proc glm;
title 'Model 5';
class sex;
model pace=age sex age*sex/solution clparm;
run;
proc glm;
title 'Model 6';
model pace=age age*age/solution clparm;
run;
proc glm;
title 'Model 7';
class sex;
model pace=age age*age sex/solution clparm;
run;
proc glm;
title 'Model 8';
class sex;
model pace=age age*age sex sex*age sex*age*age/solution clparm;
run;
ods pdf close;
