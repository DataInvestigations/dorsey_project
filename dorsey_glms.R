
library(tidyverse)
library(ggplot2)

rm(list=ls()) # clears workspace

birdata <- read.csv("5NovPatchData.csv")

head(birdata)
names(birdata)


# Hypothisis: Birds in larger colonies will have larger forehead patches
# Fitting a generalized linear model 
mod1 <- glm(Area ~ Colony.Size, data = birdata, family = gaussian)
summary(mod1)
# View model summary
# The intercept represents the predicted forehead area when Colony Size = 0
# The slope is saying how much Area changes per unit increase in colony size
# If the p value for Colony Size shows < 0.05, the relationship is significant
# Now I need to generate a predicted value of plotting
birdata$predicted <- predict(mod1, type = "response")
p= ggplot(birdata, aes(x = Colony.Size, y = Area)) +
  geom_point() +  # raw data
  geom_line(aes(y = predicted), linewidth = 1) +  # model prediction
  labs(title = "Effect of Colony Size on Forehead Patch Area",
    x = "Colony Size",
    y = "Forehead Patch Area") 
# Plotting data as a model overlaid
# Display the plot
print(p)

# Load your dataset
birdata <- read.csv("5NovPatchData.csv")

# Inspect data
head(birdata)
names(birdata)
# Hypothisis: Birds in larger colonies will have larger forehead patches
library(MASS)
mod1 <- glm.nb(Colony.Size~Area, data = birdata)
# Fit a GLM 
summary(mod1)
#KL: what does this mean? how did you know to run a negative binomial? 

newdat = with(birdata, 
              expand.grid(
                Area = 
                seq(min(Area),
                  max(Area),
                  by=1)
                )
)
              
newdat$yhat = predict(mod1, newdata = newdat, type="response")

###INTERPRETATION HERE
#This data output is given from a negative binomial regression model
#The model shows small reduction from the null model (278.86) 
# to the fitted model (274.93)
#This pretty much indicates a weak support to the hypothesis 
#that birds in larger colonies have larger forehead patches.

#what null model? what does this mean? this doesn't have anything to do with your summary

#######

#birdata$predicted <- predict(mod1, type = "response")

ggplot(birdata, aes(x = Area, y = Colony.Size)) + #data
  geom_point(shape=2) +
  geom_line(data=newdat,aes( x = Area, y = yhat), color="red")  #prediction



library(DHARMa)
simulateResiduals(mod1, plot=T)
# Result Statment: 
