#install.packages("arules")
library(arules)

groceries <- read.transactions("http://www.sci.csueastbay.edu/~esuess/classes/Statistics_6620/Presentations/ml13/groceries.csv", sep = ",")
summary(groceries)

class(groceries)

inspect(groceries[1:5])

itemFrequency(groceries[, 1:3])

itemFrequencyPlot(groceries, support = 0.01)
#itemFrequencyPlot(groceries, support = 0.1)

itemFrequencyPlot(groceries, topN = 20)

image(groceries[1:5])
summary(groceries[1:5])
image(sample(groceries, 100))

library(arules)
apriori(groceries)

groceryrules <- apriori(groceries, parameter = list(support =0.006, confidence = 0.25, minlen = 2))
groceryrules

summary(groceryrules)

inspect(sort(groceryrules, by = "lift")[1:5])

#Another example of fast moving goods. So we add constraint support=0.05 to make it FMCG with high presence.
#groceryrules <- apriori(groceries, parameter = list(support =0.05, confidence = 0.25, minlen = 2))
#inspect(sort(groceryrules, by = "lift")[1:4])


berryrules <- subset(groceryrules, items %in% "berries")
inspect(berryrules)

class(berryrules)   #Structure is arules.
groceryrules_df <- as(groceryrules, "data.frame")
str(groceryrules_df)