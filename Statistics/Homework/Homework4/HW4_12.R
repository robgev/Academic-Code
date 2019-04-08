x <- rnorm(200, mean = 3, sd = 5)
y <- runif(300, min = -2, max = 8)
quantiles <- seq(0.05, 0.95, by = 0.05)
xq <- quantile(x, quantiles)
yq <- quantile(y, quantiles)
normalQuantiles <- qnorm(quantiles)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
plot(xq, yq, main = "QQPlot x vs y")
plot(xq, normalQuantiles, main = "QQPlot x vs N(0,1)")
plot(yq, normalQuantiles, main = "QQPlot x vs N(0,1)")
# There is some linearity
# But not all points are on the same line


