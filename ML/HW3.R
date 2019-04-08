library(glmnet)
set.seed(1)
X <- rnorm(100)
e <- rnorm(100)
Y <- 2 + 0.5 * X + 4 * X^2 - 1 * X^3 + e
dataFrame <- data.frame(y = Y, x = X)
xmat <- model.matrix(y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9) + I(x^10), data = dataFrame)[, -1]

grid <- 10 ^ seq(4, -2, length = 100)
ridge <- cv.glmnet(xmat, Y, alpha = 0, lambda = grid)
plot(ridge)
cvRidgeLambda <- ridge$lambda.min
ridge <- glmnet(xmat, Y, alpha = 0, lambda = grid)
predict(ridge, s = cvRidgeLambda, type = "coefficients")[1:11, ]
# X^2 and X^3 got pretty big weights
# X^6 to X^10 have low weights

lasso <- cv.glmnet(xmat, Y, alpha = 1)
plot(lasso)
cvLambda <- lasso$lambda.min
# Now we use this lambda for refitting
lasso <- glmnet(xmat, Y, alpha = 1)
predict(lasso, s = cvLambda, type = "coefficients")[1:11, ]
# We see that this method picks X, X^2, X^3, X^6 and X^8 as variables for the model.
# However, the coeffs of X^6 and X^8 are really small (almost negligible)