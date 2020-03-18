# Counterfire radar data

# Factors:
# quadrant elevation
# bore angle
# radar mode
# aspect angle
# Projectile type
# fire rate
# shot range
# weapon-to-radar range

# response variables: P(Detect), Point of origin TLE

# proportion histogram
# two-sample proportion test
# logistic regression
# blocked/split plot design
# binomial regression

set.seed(20200311)
library(tidyverse)
library(skimr)

n <- 2873
nmission = 323
missions <- base::sample(5:13, size = nmission, replace = T)

tb <- tibble(
  Mission = 1:nmission,
  `Mission Size` = missions,
  `Radar Mode` = base::sample(c("360 degree Normal", "90 degree Normal", "90 degree Short range"), 
                        replace = T, size = nmission,
                        prob = c(.4, .15, .45)),
  `Shot Range` = rbeta(nmission, 2, 10) * 19000 + 600,
  `Aspect Angle` = (rbeta(nmission, 2, 10)  + 
                    rnorm(nmission, .5, .15) * rbinom(nmission, 1, .2)) * 170 + 5,
  `Quadrant Elevation` = rbeta(nmission, 3, 2) * 1000 + 350,
  `Radar-to-Weapon Range` = rbeta(nmission, 3, 2) * 25000 + 5000,
  `Bore Angle` = rbeta(nmission, 1, 3) * 3500) 


tb$Munition <- ifelse(tb$`Radar Mode` == "360 degree Normal",
                      yes = sample(c("Artillery", "Mortar", "Rocket"), 
                             size = nmission, replace = T, 
                             prob = c(.6, .2, .2)),
                      no = sample(c("Artillery", "Mortar", "Rocket"), 
                             size = nmission, replace = T, 
                             prob = c(.15, .7, .25)))



tb$`Fire Rate` <- ifelse(tb$Munition == "Rocket", 
                         "Single Fire",
                         sample(c("Single Fire", "Volley Fire"), size = nmission, replace = T,
                                prob = c(.7, .3)))

tb <- tb %>% 
  mutate(Detection = map(`Mission Size`, rbinom, size = 1, prob = .8)) %>% 
  unnest()
  
tb %>% 
  group_by(Munition) %>% 
  skim

 write_csv(tb, "datasets/Experimental/counterfire-radar/counterfire-radar.csv")
