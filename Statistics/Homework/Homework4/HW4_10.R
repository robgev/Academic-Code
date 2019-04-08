disp <- mtcars$disp
wt <- mtcars$wt
plot(disp, wt)
cor(disp, wt)
# The result is 0.8879799, 
# from graph we saw there is linearity between datasets
cov(disp, wt)
var(disp)
