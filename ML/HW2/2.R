# install.packages("ISLR")
library("ISLR")
fit <- lm(mpg ~ horsepower, data = Auto)
summary(fit)
# I. The std. error values are nearly zero. 
# This means that there is a relationship.
# II. R-squared values show almost 0.61 "strength"
predict(fit, data.frame(horsepower = c(85))) 
# III. 26.51906
# IV.
predict(fit, data.frame(horsepower = c(85)), interval ="confidence")
predict(fit, data.frame(horsepower = c(85)), interval ="prediction")
# b)
plot(Auto$horsepower, Auto$mpg, main =" MPG vs Horsepower", xlab = " HP", ylab ="MPG")
abline(fit, lwd=2, col="red")
# c)
par(mfrow=c(2,2))
plot(fit)
# The first plot shows parabolic, U-Shaped pattern between the residuals and the fitted values. 
# So we can say that the relationship is probably not linear. 
# The second plot shows that the residuals are normally distributed as Q Q line is almost perfectly
# Straight
# The third plot shows that the variance of the errors is not constant. 
# Finally, the fourth plot indicates that there are some high leverage points in the data.

# d) It does suggest that there may be some outliers. And also there are some
# with high leverage. 