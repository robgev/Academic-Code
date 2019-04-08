#install.packages("glmnet", dependencies=TRUE)
library(glmnet)
n = 100 ## number of observations\
x <- rnorm(100)
e <- rnorm(100)
b0 = 15
b1 = 4
b2 = -5
b3 = 1
y <- b0 + b1 * x + b2 * x^2 + b3 * x^3 + e
data <- data.frame(y = y, x = x)
xmat <- model.matrix(y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9) + I(x^10), data = data)[, -1]

grid=10^seq(10,-2,length=100)   
ridge <- cv.glmnet(xmat, y, lambda=grid, alpha=0)
lasso <- cv.glmnet(xmat, y, alpha=1)
coef(ridge)
coef(lasso)


par(mfrow=c(2,1))
plot(ridge)
plot(lasso)
## In case if RIDGE we can see that as lambda increases, coefficients tend to 0 but none of them 
## becomes exactly 0
## in case of LASSO we can observe that with the increase of lambda 
## coefficients become 0


set.seed(1)
train=sample(1:nrow(xmat), nrow(xmat)/2)
test=(-train)
y_test=y[test]
y_train=y[train]
xmat[train,]
y_train
y_test
set.seed(1)
cv_out_ridge=cv.glmnet(xmat[train,],y[train],alpha=0, lambda=grid)
bestlam_ridge=cv_out_ridge$lambda.min
ridge <- glmnet(xmat[train,],y[train],alpha=0)
ridge_coef=predict(ridge, newx = xmat[test,], type="coefficients",s=bestlam_ridge)[1:11,]
ridge_coef
cv_out_lasso=cv.glmnet(xmat[train,],y[train],alpha=1, lambda=grid)
bestlam_lasso=cv_out_lasso$lambda.min
lasso_coef=predict(lasso, newx = xmat[test,],type="coefficients",s=bestlam_lasso)[1:11,]
lasso_coef

lasso_coef[lasso_coef!=0]

# As we can see interpretability of lasso is better, because there remain only 5
# features as other coefficients became 0 unlike the case of ridge. 

