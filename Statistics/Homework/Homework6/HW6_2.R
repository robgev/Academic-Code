colors <- c('red', '#CCCC00', 'blue', 'green', '#00CCCC', 'yellow', 'black', '#AA00AA', '#EB8282');
degrees <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
x <- seq(0, 25, by = 0.01)
layout(matrix(c(1,2), 1, 2, byrow = TRUE))
for(i in degrees) {
  plot(
    x, 
    xlim=c(0,25),
    ylim=c(0, 0.5),
    dchisq(x, df = i),
    type="l",
    col=colors[i],
    main="Chi Squared PDF", 
    xlab = "x", 
    ylab = "Values",
    lwd = 2
  )
  par(new = (i != 9))
}

for(i in degrees) {
  plot(
    x, 
    xlim=c(0,25),
    ylim=c(0, 1),
    pchisq(x, df = i),
    type="l",
    col=colors[i],
    main="Chi Squared CDF", 
    xlab = "x", 
    ylab = "Values",
    lwd = 2
  )
  par(new = (i != 9))
}
