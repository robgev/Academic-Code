set.seed(1)
X <- rnorm(100) #Defaults to standard normal N(0, 1)
e <- rnorm(100, mean = 0, sd = 0.25)
Y <- -1 + 0.5 * X + e
# There is a strong correlation between X and Y (close to 0.65ish)
plot(X, Y)
fit <- lm(Y ~ X) 
# -1.00942 is really close to -1 we real value. Same for 0.499 and 0.5
# We have 0.7784 in Multiple R-squared => model fits really well
summary(fit)
abline(fit, col="red")
abline(-1, 0.5, col = "blue")
legend(
  "bottomright", 
  c("Regression line", "Real Population Line"), 
  lwd=1, 
  col=c("red", "blue"),
  bty ="n"
)
fit_quadr <- lm(Y ~ poly(X,2))
summary(fit_quadr)
# Coeff of quadratic term is not significant at 5% level
# Fit values (Multiple R-squared etc) are close to linear ones so quadratic
# term is insignificant

set.seed(1)
X_n = rnorm(100, mean = 0, sd = 0.5)
set.seed(1)
X_l = rnorm(100, mean = 0, sd = 0.125)
Y_n = -1 + 0.5 * X + X_n
Y_l = -1 + 0.5 * X + X_l

fit2 = lm(Y_n ~ X)
fit3 = lm(Y_less ~ X)
confint(fit)
confint(fit2)
confint(fit3)
