#Create groupings for contact methods
#load packages (install if not already downloaded)
library(tidyverse)
library(readxl)
#read data in
seniorData <- read_excel("02-design-students.xlsx")

#sort data by subgroups
seniorData <- seniorData %>% arrange(College, Gender, RaceEth, Major, CumulativeGPA)

#table to get counts (just for my curiousity)
table(seniorData$College, seniorData$RaceEth, seniorData$Gender)
#going to combine one student with race = two or More Races with students with race = Two or More Races (I think just a typo)

seniorData$RaceEth[seniorData$RaceEth == "two or More Races"] <- "Two or More Races"

#Now go through each combo of College/Gender/Race and randomly allocate to "treatment" 1, 2, or 3 (email types)

#obtain counts for each subgroup
counts <- seniorData %>% group_by(College, Gender, RaceEth) %>% summarise(n = n()) 

#create random allocations (note there could be some slight unbalancing - shouldn't be a big deal though)
set.seed(420420)

#write function to do the randomization
allocate <- function(ntrt, count){
	sample(rep(1:ntrt, times = ceiling(count/ntrt)))[1:count]
}

seniorData$Treatment <- unlist(sapply(X = counts$n, FUN = allocate, ntrt = 3))

#just to double check equal assignment
table(seniorData$Treatment, seniorData$College, seniorData$Gender, seniorData$RaceEth)

#output to file
write_csv(x = seniorData, path = "02-design-randomization.csv")
