# In R studio, go to Session -> Set Working
# Directory -> To Source File Location
data <- read.csv(file="Hw07p06.csv", header=FALSE, sep=",")
n = 10;
sums = integer(n)
for (j in 1:n) {
  sums <- sums + data[[paste('V', j, sep="")]]
}
estimates <- sums / (n + 1);
hist(
  estimates, 
  ylim = c(0, 1), 
  xlim = c(2, 4.5), 
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
  ylim = c(0, 1), 
  xlim = c(2, 4.5), 
  xlab = 'Estimates',
  ylab = 'Density & Kernel Value',
  main = 'KDE and Density Histogram of Estimates'
)
