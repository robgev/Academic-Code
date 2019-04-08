experiment <- function() {
  points <- 2 * rbinom(1000,1,.5) - 1; # Gives values 0 and 1, make it 1 and -1
  result <- 1; # Initial value 1 as we have multiplication
  for (i in seq(1000, 1, by=-1)) {
    result <- sqrt(result * (points[i] / 2) + 1/2);
  }
  return (result);
}

# ----- main ----- #
points <- integer(1000)
for (i in 1:1000) {
  points[i] = experiment();
}
hist(points, freq=F)