library("ISLR")
data("Carseats")
fit <- lm(Sales ~ Price + Urban + US, data = Carseats)
summary(fit)
# b) The predictor 'Urban'. 
# Its p-value is 0.936 so we can reject the null hypothesis
fit2 <- lm(Sales ~ Price + US, data = Carseats)
summary(fit2)
# R-sq values are ~ 0.24 so model fits not so well
confint(fit2)
par(mfrow=c(2,2))
plot(fit2)
# We can see that there is no strong relationship of any 
# Shape from the first graph
# Again, normal distrib. 
# Scale-Location does not show any highlighted outlier
# The Residuals  Leverage graph notes 1 very high leverage observation.