library(ggplot2)
library(tidyverse)
library(performance)

#KL - your code isn't clear here or replacing mine
#It starts all the way at the bottom so the rest of the stuff should be deleted
sdat = read.csv("5NovPatchData.csv")
head(sdat)

library(tidyverse)
library(performance)
library(ggplot2)


#transform - this isn't your dataframe so don't include
#batdat$lgdL = log10(batdat$gdL)
#batdat$lcount = log10(batdat$count)

#run linear model - continous predictor
mod1 = lm(lgdL~lcount, data = batdat)
#batdat is my data, not yours
summary(mod1)

#y = ax + b 
#lgdL = -0.7043x + (-1.6718)
#Predictor is *continuous* so value is slope (-0.704) (or coef)

# Running a linear model in R - categorical predictor
# note - you only need to run one model for the assignment - not 2!
mod2 = lm(lgdL~species, data = batdat)
summary(mod2)
#First line (labeled INTERCEPT) is actually the REFERENCE
#This is the omitted group; (EPFU) in this case
#Each other parameter listed is in REFERENCE to the estimated value of the this variable!
#e.g. speciesMYLU is saying that MYLU have, on average, 0.61607 more fungus than EPFU

hist(resid(mod1))

plot(mod1)

#install.packages(performance)

#load performance
library(performance)

check_model(mod1)

###### ---------------plot model---------------####
# continuous!!
library(ggplot2)
r=ggplot(data=batdat, aes(x=lcount, y=lgdL))+ 
  geom_point()+
  stat_smooth(method = "lm")+
  theme_bw() + 
  theme(axis.title=element_text(size=20),axis.text=element_text(size=10),panel.grid = element_blank(), axis.line=element_line(),legend.position="top",legend.title=element_blank())
print(r)

# categorical
r=ggplot(data=batdat, aes(x=species, y=lgdL))+ 
  geom_point()+
  stat_summary(fun.data = "mean_se", colour="red", size=1)+ 
  theme_bw() + 
  theme(axis.title=element_text(size=20),axis.text=element_text(size=10),panel.grid = element_blank(), axis.line=element_line(),legend.position="top",legend.title=element_blank())
print(r)


#is this where yours starts?
mod1 <- lm(y ~ x, data = sdat)
mod1 <- lm(y ~ x, data = sdat)
mod1 <- lm(Area ~ Patch, data = sdat)
names(sdat)
mod1 <- lm(Area ~ Sex, data = sdat)
summary(mod1)
#what is this saying?
sdat <- read.csv("5NovPatchData.csv")
head(sdat)
names(sdat)
mod1 <- lm(Area ~ Sex, data = sdat)
summary(mod1)
mod1 <- lm(Area ~ Sex, data = sdat)
summary(mod1)
mod1 <- lm(Area ~ Sex, data = sdat)
summary(mod1)
plot(mod1)
#what does this say?

ggplot(sdat, aes(x = Sex, y = Area)) +
  geom_point() +
  stat_summary(fun.data = mean_se, color = "red") +
  theme_bw()
mod1 <- lm(Area ~ Sex, data = sdat)
summary(mod1)
plot(mod1)
names(sdat)
#[1] "Area" "Sex" "Length"
#this line doesn't run
ggplot(sdat, aes(x = Sex, y = Area)) +
  geom_point() +
  stat_summary(fun.data = mean_se, color = "red") +
  theme_bw()
library(tidyverse)
library(ggplot2)
library(performance)

sdat <- read.csv("5NovPatchData.csv")

mod1 <- lm(Area ~ Year, data = sdat)
summary(mod1)

par(mfrow = c(2,2))
plot(mod1)

check_model(mod1)

ggplot(sdat, aes(x = Year, y = Area)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE) +
  theme_minimal()
# I used a linear model to test whether year predicted area
# I ran using lm(area - year, data = sdat)
# then i checked the modle using a diagnostic plot
# residual vs fitted showed a slight curve
# the q-q plot was close to a stright line = it was normal
# the scale location plot looks even
# the residuals vs leverage plot did not show major points of influence
# then i plotted relationships in ggplot using stat_smooth(method = "lm"
# grapgh is relationship from year and area )
ggplot(sdat, aes(x = Year, y = Area)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE) +
  theme_minimal()
summary(mod1)
plot(mod1)









