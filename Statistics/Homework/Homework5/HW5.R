n <- 20000;
experiment_count <- 5000;
means <- integer(experiment_count);

for (i in 1:experiment_count) {
  # remove comment from the distrib. you want to try
  #values <- rexp(n, rate = 3);
  # values <- rpois(n, lambda = 5);
  # values <- runif(n, min=1, max = 4)
  values <- rbinom(n, size=6, prob = 1/3)
  means[i] = mean(values);
}
x <- seq(-4, 4, by=0.00001)
hx <- dnorm(x)
plot(
  x, 
  hx, 
  type="l", 
  ylim=c(0,.5),
  xlim=c(-4,4), 
  xlab="x value",
  ylab="Density", 
  main="Normal curve and experiment's density histogram"
)
par(new = T)
hist(
  (means - mean(means)) / sd(means), # Standardizing -> (X - E(X)) / sqrt(Var(x))
  xlab="x value",
  ylab="Density",
  ylim=c(0,.5),
  xlim=c(-4,4),
  freq=F, 
  main="Normal curve and experiment's density histogram"
)