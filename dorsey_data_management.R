sdat = read.csv("/Users/reagandorsey/Documents/bio_data_sp2026/data/5NovPatchData.csv")

#load important packages##
library(tidyverse)
library(tidyr)
library(dplyr)

head(sdat)
# there are no mistakes
"group by" 

head(sdat)
View(sdat)

# Summarise
sdat %>% 
  group_by(Sex) %>% 
  summarise(mean.patch=mean(Area,na.rm=TRUE))
# this gives a summary table, it doesn't change sdat!
# Summarise by "Sex" putting male and female in different categorizes
# In colums of "Sex" and "mean.patch"

## Summarise versus Mutate

# Mutate adds a column
# when mutating, you can just call the object you are making
# the same thing as your original dataframe
# because you are adding a column based on your
# original dataframe
sdat = sdat %>% 
  #replace batdat with a new dataframe that has something you want
  group_by(Sex) %>% 
  #you can group_by multiple things
  mutate(mean.patch=mean(Area,na.rm=TRUE))
#this adds a column to the dataframe
View(sdat)

sdat = sdat %>% 
  group_by(Year) %>% 
  mutate(mean.patch=mean(Area,na.rm=TRUE)
sdat
# pretty much the difference 
# is that the summaries gives you 2 numbers 
# and the mutate gives you a whole new column 
# it is the same values but different locations 
# plus another addition to the table
