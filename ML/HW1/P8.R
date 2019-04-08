# Session -> Set Working Directory -> To source file location
# install.packages("ggplot2")
library(ggplot2)
auto <- read.csv("Auto.csv", na.strings = "?")
auto <- na.omit(auto)

str(auto) # To see the column data types of auto

summary(auto) # To see main characteristics of the dataset

sapply(auto[, -c(4, 9)], mean)
sapply(auto[, -c(4, 9)], sd)

# OR to get range  and sd we can do
# range(auto$mpg)
# range(auto$cylinders)
# range(auto$displacement)
# range(auto$horsepower)
# range(auto$weight)
# range(auto$acceleration)
# range(auto$year)

# sd(auto$mpg)
# sd(auto$cylinders)
# sd(auto$displacement)
# sd(auto$horsepower)
# sd(auto$weight)
# sd(auto$acceleration)
# sd(auto$year)

cylFactor <- as.factor(auto$cylinders)
yearFactor <- as.factor(auto$year)
originFactor <- as.factor(auto$origin)
pairs(auto)

ggplot(auto, aes(x = mpg, y = weight)) + geom_point()
ggplot(auto, aes(x = mpg, y = horsepower)) + geom_point()
ggplot(auto, aes(x = mpg, y = displacement)) + geom_point()

ggplot(auto, aes(x = horsepower, y = weight)) + geom_point()
ggplot(auto, aes(x = year, y = mpg)) + geom_point()

ggplot(auto, aes(x = origin, y = mpg)) + geom_point()

