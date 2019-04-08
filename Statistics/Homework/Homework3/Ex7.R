experimentMean <- function() {
  means <- integer(1000)
  for (i in 1:1000) {
    numbers <- rexp(1000, rate = 2);
    means[i] <- mean(numbers);
  }
  return(mean(means));
}

experimentVar <- function() {
  variances <- integer(1000)
  for (i in 1:1000) {
    numbers <- rexp(1000, rate = 2);
    variances[i] <- var(numbers);
  }
  return(mean(variances));
}

expectation <- 0.5 # E(x) = 1/lambda
variance <- 0.25 # Var(x) = 1/lambda^2
expDiff <- abs(expectation - experimentMean()) # was 0.0004694198 on the first run\
expVar <- experimentVar() # Variance with denom. N - 1
expVar1 <- expVar * 1000 / 999 # Variance with denom. N
varDiff <- abs(variance - expVar) # Was 5.942892e-05 on the first run
varDiff1 <- abs(variance - expVar1) # Was 0.0001907618 on the first run