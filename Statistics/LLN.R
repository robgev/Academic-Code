means <- c()
for (i in 1:20000) {
  x <- runif(10 * i, min = 1, max = 4)
  means[i] <- mean(x)
}
plot(means, type="l", lwd = 1)
abline(h = 2.5, lwd = 2, col = "red")