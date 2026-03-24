
library(ggplot2)
sdat = read.csv("5NovPatchData.csv")
head(sdat)


g1 = ggplot(data=sdat, aes(x = Year, y = Colony.Size, color=forehead))+
  geom_point(size=2)
g1

#I made a graph wit the swallow data
#Where the X axis is "Year" & the Y axis is "Colony size"
#The color is organized by forehead patches from a range of 0.1 to 0.4

g1 = ggplot(data=sdat, aes(x = Sex, y = Colony.Size))+
  geom_boxplot(fill = "lightblue")
  


g1 = ggplot(data=sdat, aes(x = Sex, y = Colony.Size, fill=Sex))+
   geom_boxplot() +
  scale_fill_manual(values = c("F" = "red", "M" = "blue"))
g1

library(ggpattern)

dorsey_week6_datavisualization.R