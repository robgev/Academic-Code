p <- 0.3
n <- 400
experiment_count <- 1000
est1 <- integer(experiment_count)
est2 <- integer(experiment_count)
for(i in 1:experiment_count) {
  x <- rbinom(n, size = 1, prob = p)
  est1[i] <- mean(x)
  est2[i] <- sum(x[1:(n-4)]) / n
}
layout(matrix(c(1,2), 1, 2, byrow = TRUE))
hist(est1)
abline(v = p, col="red", lwd=2)
hist(est2)
abline(v = p, col="red", lwd = 2)

mean(est1)
mean(est2)