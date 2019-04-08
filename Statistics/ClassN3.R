x <- as.numeric(precip)
x
hist(x, xlim = c(0, 81), ylim = c(0, .05), freq = F)
f <- density(x, kernel = "epanechnikov")
par(new = T)
plot(f, col = "red", lwd = 2, xlim = c(0, 81), ylim = c(0, .05))