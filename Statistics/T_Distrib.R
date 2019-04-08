curve(dt(x, df = 2), -5, 5)
par(new=T)
curve(dnorm(x), -5, 5, col='red', lwd=2)

y <- rt(200, df = 2)
qqnorm(y)
qqline(y)


z <- rnorm(200)
qqplot.t(z, df = 2)
qqline(z)
