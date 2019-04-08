library("ISLR")
pairs(Auto)
cor(Auto[, names(Auto) !="name"])
fit <- lm(mpg ~. -name, data = Auto)
summary(fit)
# I. Yes, P value of almost every predictor is really small
# Some of big ones are horsepower, acceleration and cylinders
# Which are most probably insignificant
# R-Squared shows 83% so there is a strong relationship
# II. All except abovementioned ones, i.e. displacement,
# weight, year, origin
# III. When every other predictor held constant, 
# the mpg value increases with each year that passes.
par(mfrow = c(2,2))
plot(fit)
# d) and e)
# The first graph shows that there is a non-linear relationship between the responce and the predictors;
# The second graph shows that the residuals are normally distributed and right skewed;
# The third graph shows that some observations are potential outliers
# Specifically the observation 14 is a highly leverage point as shown in Residuals vc Leverage graph
fit2 <- lm(mpg ~.-name+displacement:weight, data = Auto)
summary(fit2)

fit3 <- lm(mpg ~.-name+displacement:cylinders+displacement:weight+acceleration:horsepower, data=Auto)
summary(fit3)

fit4 <- lm(mpg ~.-name+displacement:cylinders+displacement:weight+year:origin+acceleration:horsepower, data=Auto)
summary(model)

fit5 <- lm(mpg ~.-name-cylinders-acceleration+year:origin+displacement:weight+
             displacement:weight+acceleration:horsepower+acceleration:weight, data=Auto)
summary(fit5)
# From all the 4 models, the last model is the only one with all variables being significant. 
# And, based on results from a few trials not show here, it is very likely that it is the 
# best combination of predictors and interaction terms. The R-squared statistics 
# estimates that 87% of the changes in the response can be explained by this 
# particular set of predictors ( single and interaction.) 
# A higher value was not obtained from the trials.  

fit6 <- lm(data = Auto[,1:8], mpg ~ log(horsepower)*log(weight)*log(displacement))
summary(fit6)
# we can observe that all parameters are significant especially, horsepower, weight, displacement