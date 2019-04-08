# In R studio, go to Session -> Set Working
# Directory -> To Source File Location
data <- read.csv(file="Hw07p05.csv", header=FALSE, sep=",")
sums = integer(10)
for (j in 2:11) {
  sums <- sums + data[[paste('V', j, sep="")]]
}
estimates <- sums / 10;
hist(
  estimates, 
  xlim = c(0, 1), 
  ylim = c(0, 2.5), 
  freq = F,
  xlab = 'Estimates',
  ylab = 'Density & Kernel Value',
  main = 'KDE and Density Histogram of Estimates'
)
f <- density(estimates)
par(new = T)
plot(
  f, 
  col = "red", 
  lwd = 2, 
  xlim = c(0, 1), 
  ylim = c(0, 2.5), 
  xlab = 'Estimates',
  ylab = 'Density & Kernel Value',
  main = 'KDE and Density Histogram of Estimates'
)

mean(estimates)

#' As we can see mean of estimates is close to 0.4 rather
#' than 0.5. Besides that, both KDE and histogram are right
#' skewed towards 0.4 which means that the coin is a little
#' bit biased and will more often show Tails than H
