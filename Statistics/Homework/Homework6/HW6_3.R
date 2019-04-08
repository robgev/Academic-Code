#3.c
pgamma(3.1, shape=3, scale=4)

#3.d
colors <- c('red', '#CCCC00', 'blue', 'green', '#00CCCC', '#AA00AA', '#EB8282');
params <- c(1, 2, 3, 5, 8, 15, 30)
x <- seq(0, 25, by = 0.01)
layout(matrix(c(1,2), 1, 2, byrow = TRUE))
for(i in 1:length(params)) {
  plot(
    x, 
    xlim=c(0,25),
    ylim=c(0, 0.4),
    dgamma(x, shape=3, scale=params[i]),
    type="l",
    col=colors[i],
    main="Same Shape, Different Scales", 
    xlab = "x", 
    ylab = "Values",
    lwd = 2
  )
  text(10, 0.2 + i * 0.025, paste(c("~Gamma(3,",params[i],")"), collapse = ""), cex=0.6, pos=4, col=colors[i])
  par(new = (i != length(params)))
}

for(i in 1:length(params)) {
  plot(
    x, 
    xlim=c(0,25),
    ylim=c(0, 0.4),
    dgamma(x, shape=params[i], scale=4),
    type="l",
    col=colors[i],
    main="Same Scale, Different Shapes", 
    xlab = "x", 
    ylab = "Values",
    lwd = 2
  )
  text(10, 0.2 + i * 0.025, paste(c("~Gamma(",params[i],",4)"), collapse = ""), cex=0.6, pos=4, col=colors[i])
  par(new = (i != length(params)))
}

