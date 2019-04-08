data <- c(2, 2, 2, 5, 3, 2, 0, 0, 3, 5)
hist(
  data, 
  xlim = c(-1, 6), 
  ylim = c(0, .55), 
  freq = F,
  xlab = 'Data',
  ylab = 'Density & Kernel Value',
  main = 'KDE and Density Histogram of Data'
)
f <- density(data)
par(new = T)
plot(
  f, 
  col = "red", 
  lwd = 2, 
  xlim = c(-1, 6), 
  ylim = c(0, .55),
  xlab = 'Data',
  ylab = 'Density & Kernel Value',
  main = 'KDE and Density Histogram of Data'
)
